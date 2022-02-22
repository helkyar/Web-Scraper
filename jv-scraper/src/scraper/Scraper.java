/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package scraper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

/**
 * Inspiration: https://www.youtube.com/watch?v=tI1qGwhn_bs&t=704s
 *              https://github.com/ShaneLee/Java-Web-Stock-Scraper
 * @author Javier Palacios
 */
public class Scraper {   
    private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/bets";
    private static final String user = "root";
    private static final String pass = "";
        
    private static PreparedStatement ps = null;
    private static Connection conn = null;
    private static Statement st = null;
    private static ResultSet rs = null;
    
    private static int id = 0;
    
    private static ArrayList<String> teams = new ArrayList<>();
    private static Map<String,Integer[]> statistics = new HashMap<>();
        
     /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /**
         * check by order tot track results and due payment (asign id:ref)
         * check if date still exists or there is a new one (!=int-int->update)
         */
 
        final String URL = "https://www.marca.com/futbol/primera-division/calendario.html";
    
        try {
            final Document document = Jsoup.connect(URL).get();
            
//            System.out.println(document.outerHtml());
            id = getCurrentGamesCount();
            for (Element table : document.select(".jor")) {
                for(Element tr:table.select("tr")){
                    if(tr.select(".local").text().equals("")){continue;}
                    final String loc = tr.select(".local").text();
                    final String vis = tr.select(".visitante").text();
                    final String res = tr.select(".resultado").text();
//                    storeInDatabaseGames(id, loc, vis, res);
//                    storeInDatabaseTeams(loc);
                    updateTeamsGoals(loc, vis, res);
                    updateDatabaseGames(id, loc, vis, res);
                    id++;
                }           
            }            
            executeUpdateGoals();   
        } catch (Exception ex) {ex.printStackTrace();}
        
    }
// =============================================================================
//                             DBCONNECTION 
//                                INSERT
// =============================================================================
    private static void storeInDatabaseGames(int id, String loc, String vis, String res) {
        
        final String query = "INSERT INTO `games` (`scraper_id`, `local`, "
            + "`visitor`, `local_result`, `visitor_result`, `date`) VALUES "
            + "(?, ?, ?, ?, ?, ?)";

        int localResult, visitorResult;
        String date;
        if(res.contains("-")){
            String[] sepres = res.split("-");
            localResult = Integer.parseInt(sepres[0]);
            visitorResult = Integer.parseInt(sepres[0]);
            date = null;
        } else {
            localResult = -1;
            visitorResult = -1;
            date = res.split(" ")[0];
            System.out.println(date);
        }
            
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {System.out.println("Driver lost");}     
        
        try {
            conn = DriverManager.getConnection(url, user, pass);
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, loc);
            ps.setString(3, vis);
            ps.setInt(4, localResult);
            ps.setInt(5, visitorResult);
            ps.setString(6, date);
            ps.executeUpdate();                
                         
        } catch (SQLException ex) {ex.printStackTrace();}      
        finally { try {conn.close();} catch (SQLException ex) {ex.printStackTrace();}}         
    }    
    
    private static void storeInDatabaseTeams(String team){
        
        final String query = "INSERT INTO `teams` (`teamname`) VALUES (?)";

        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {System.out.println("Driver lost");}     
        
        try {
            if(!teams.contains(team)){
                teams.add(team);
            
                conn = DriverManager.getConnection(url, user, pass);
                ps = conn.prepareStatement(query);
                ps.setString(1, team);
                ps.executeUpdate();                
            }            
        } catch (SQLException ex) {ex.printStackTrace();}      
        finally { try {conn.close();} catch (SQLException ex) {ex.printStackTrace();}}   
    }

    private static void updateTeamsGoals(String loc, String vis, String res) {
        if(res.contains("-")){  
            int locg = Integer.parseInt(res.split("-")[0]);
            int visg = Integer.parseInt(res.split("-")[1]);
            Integer[] results = {0,0,0,0,0,0};
            if(!statistics.containsKey(loc)){statistics.put(loc, results);}
            else if(!statistics.containsKey(vis)){statistics.put(vis, results);}
            else {
                Integer[]locst = statistics.get(loc);
                Integer[]visst = statistics.get(vis);
                locst[0] += locg; //local_won
                locst[1] += visg; //local_lost
                visst[2] += visg;//visitor_won
                visst[3] += locg;//visitor_lost
                locst[4]++;//local_game
                visst[5]++;//visitor_game
                statistics.put(loc, locst);               
                statistics.put(vis, visst);               
            }         
        }
    }

    private static void executeUpdateGoals() {
        for(String team : statistics.keySet()){
            try {
                int locw = statistics.get(team)[0];
                int locl = statistics.get(team)[1];
                int visw = statistics.get(team)[2];
                int visl = statistics.get(team)[3];
                int locg = statistics.get(team)[4];
                int visg = statistics.get(team)[5];
                
                final String query = "UPDATE `teams` SET `local_won`='"+locw+"'"
                    + ", `local_lost`='"+locl+"', `visit_won`='"+visw+"', "
                    + "`visit_lost`='"+visl+"', `local_game`='"+locg+"', "
                    + "`visit_game`='"+visg+"' WHERE teamname='"+team+"'";
                
                conn = DriverManager.getConnection(url, user, pass);
                ps = conn.prepareStatement(query);      
                ps.executeUpdate();
                         
        } catch (SQLException ex) {ex.printStackTrace();}      
        finally { try {conn.close();} catch (SQLException ex) {ex.printStackTrace();}} 
        
        }
    }

    private static void updateGameResults(int id, String res) {
        try {
                
            if(res.contains("-")){
                final String query = "UPDATE `games` SET "
                    + "`local_result`='"+res.split("-")[0]+"', "
                    + "`visitor_result`='"+res.split("-")[1]+"' "
                    + "WHERE scraper_id='"+id+"'";

                conn = DriverManager.getConnection(url, user, pass);
                ps = conn.prepareStatement(query);      
                ps.executeUpdate();
            }
                         
        } catch (SQLException ex) {ex.printStackTrace();}      
        finally { try {conn.close();} catch (SQLException ex) {ex.printStackTrace();}}
    }
    
    private static void updateDatabaseGames(int id, String loc, String vis, String res) {
        
        final String query = "UPDATE `games` SET `local`=?, `visitor`=?, "
                + "`local_result`=?, `visitor_result`=?, `date`=? "
                + "WHERE `scraper_id`='"+id+"'";

        int localResult, visitorResult;
        String date;
        if(res.contains("-")){
            String[] sepres = res.split("-");
            localResult = Integer.parseInt(sepres[0]);
            visitorResult = Integer.parseInt(sepres[0]);
            date = null;
        } else {
            localResult = -1;
            visitorResult = -1;
            date = res.split(" ")[0];
            System.out.println(date);
        }
            
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {System.out.println("Driver lost");}     
        
        try {
            conn = DriverManager.getConnection(url, user, pass);
            ps = conn.prepareStatement(query);
            ps.setString(1, loc);
            ps.setString(2, vis);
            ps.setInt(3, localResult);
            ps.setInt(4, visitorResult);
            ps.setString(5, date);
            ps.executeUpdate();                
                         
        } catch (SQLException ex) {ex.printStackTrace();}      
        finally { try {conn.close();} catch (SQLException ex) {ex.printStackTrace();}}         
    }   

    private static int getCurrentGamesCount() {
        String query = "SELECT scraper_id FROM games ORDER BY scraper_id DESC LIMIT 1";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(query);
            
            //+1 to avoid overwriting the last row
            if (rs.next()) {return rs.getInt(1)+1;} 
            else {return 0;}
            
       } catch (SQLException ex) {ex.printStackTrace(); return 0;}      
        finally { try {conn.close();} catch (SQLException ex) {ex.printStackTrace();}}
    }
}