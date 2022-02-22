-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2022 at 08:09 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bets`
--
DROP DATABASE IF EXISTS `bets`;
CREATE DATABASE `bets`;
USE `bets`;
-- --------------------------------------------------------

--
-- Table structure for table `bets`
--

CREATE TABLE `bets` (
  `bet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `bet_pay` int(11) NOT NULL,    
  `bet_type` int(11) NOT NULL,
  `bet_amount` int(11) NOT NULL,
  `resolved` int(1) NOT NULL DEFAULT '0',
  `show` int(1) NOT NULL DEFAULT '1', 
  `result_local` int(11) NOT NULL,
  `result_visit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `game_id` int(11) NOT NULL,
  `local` varchar(20) DEFAULT NULL,
  `visitor` varchar(20) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `visitor_result` int(11) NOT NULL,
  `local_result` int(11) NOT NULL,
  `scraper_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`game_id`, `local`, `visitor`, `date`, `visitor_result`, `local_result`, `scraper_id`) VALUES
(2468, 'Valencia', 'Getafe', NULL, 0, 1, 0),
(2469, 'Cádiz', 'Levante', NULL, 1, 1, 1),
(2470, 'Mallorca', 'Betis', NULL, 1, 1, 2),
(2471, 'Alavés', 'Real Madrid', NULL, 4, 1, 3),
(2472, 'Osasuna', 'Espanyol', NULL, 0, 0, 4),
(2473, 'Celta', 'Atlético', NULL, 2, 1, 5),
(2474, 'Barcelona', 'R. Sociedad', NULL, 2, 4, 6),
(2475, 'Sevilla', 'Rayo', NULL, 0, 3, 7),
(2476, 'Villarreal', 'Granada', NULL, 0, 0, 8),
(2477, 'Elche', 'Athletic', NULL, 0, 0, 9),
(2478, 'Betis', 'Cádiz', NULL, 1, 1, 10),
(2479, 'Alavés', 'Mallorca', NULL, 1, 0, 11),
(2480, 'Espanyol', 'Villarreal', NULL, 0, 0, 12),
(2481, 'Granada', 'Valencia', NULL, 1, 1, 13),
(2482, 'Athletic', 'Barcelona', NULL, 1, 1, 14),
(2483, 'R. Sociedad', 'Rayo', NULL, 0, 1, 15),
(2484, 'Atlético', 'Elche', NULL, 0, 1, 16),
(2485, 'Levante', 'Real Madrid', NULL, 3, 3, 17),
(2486, 'Getafe', 'Sevilla', NULL, 1, 0, 18),
(2487, 'Osasuna', 'Celta', NULL, 0, 0, 19),
(2488, 'Mallorca', 'Espanyol', NULL, 0, 1, 20),
(2489, 'Valencia', 'Alavés', NULL, 0, 3, 21),
(2490, 'Celta', 'Athletic', NULL, 1, 0, 22),
(2491, 'Elche', 'Sevilla', NULL, 1, 1, 23),
(2492, 'R. Sociedad', 'Levante', NULL, 0, 1, 24),
(2493, 'Betis', 'Real Madrid', NULL, 1, 0, 25),
(2494, 'Barcelona', 'Getafe', NULL, 1, 2, 26),
(2495, 'Cádiz', 'Osasuna', NULL, 3, 2, 27),
(2496, 'Rayo', 'Granada', NULL, 0, 4, 28),
(2497, 'Atlético', 'Villarreal', NULL, 2, 2, 29),
(2498, 'Levante', 'Rayo', NULL, 1, 1, 30),
(2499, 'Athletic', 'Mallorca', NULL, 0, 2, 31),
(2500, 'Espanyol', 'Atlético', NULL, 2, 1, 32),
(2501, 'Osasuna', 'Valencia', NULL, 4, 1, 33),
(2502, 'Cádiz', 'R. Sociedad', NULL, 2, 0, 34),
(2503, 'Real Madrid', 'Celta', NULL, 2, 5, 35),
(2504, 'Getafe', 'Elche', NULL, 1, 0, 36),
(2505, 'Granada', 'Betis', NULL, 2, 1, 37),
(2506, 'Villarreal', 'Alavés', NULL, 2, 5, 38),
(2507, 'Sevilla', 'Barcelona', NULL, 1, 1, 39),
(2508, 'Celta', 'Cádiz', NULL, 2, 1, 40),
(2509, 'Rayo', 'Getafe', NULL, 0, 3, 41),
(2510, 'Atlético', 'Athletic', NULL, 0, 0, 42),
(2511, 'Elche', 'Levante', NULL, 1, 1, 43),
(2512, 'Alavés', 'Osasuna', NULL, 2, 0, 44),
(2513, 'Mallorca', 'Villarreal', NULL, 0, 0, 45),
(2514, 'R. Sociedad', 'Sevilla', NULL, 0, 0, 46),
(2515, 'Betis', 'Espanyol', NULL, 2, 2, 47),
(2516, 'Valencia', 'Real Madrid', NULL, 2, 1, 48),
(2517, 'Barcelona', 'Granada', NULL, 1, 1, 49),
(2518, 'Getafe', 'Atlético', NULL, 2, 1, 50),
(2519, 'Athletic', 'Rayo', NULL, 2, 1, 51),
(2520, 'Levante', 'Celta', NULL, 2, 0, 52),
(2521, 'Espanyol', 'Alavés', NULL, 0, 1, 53),
(2522, 'Sevilla', 'Valencia', NULL, 1, 3, 54),
(2523, 'Real Madrid', 'Mallorca', NULL, 1, 6, 55),
(2524, 'Villarreal', 'Elche', NULL, 1, 4, 56),
(2525, 'Granada', 'R. Sociedad', NULL, 3, 2, 57),
(2526, 'Osasuna', 'Betis', NULL, 3, 1, 58),
(2527, 'Cádiz', 'Barcelona', NULL, 0, 0, 59),
(2528, 'Alavés', 'Atlético', NULL, 0, 1, 60),
(2529, 'Valencia', 'Athletic', NULL, 1, 1, 61),
(2530, 'Sevilla', 'Espanyol', NULL, 0, 2, 62),
(2531, 'Real Madrid', 'Villarreal', NULL, 0, 0, 63),
(2532, 'Mallorca', 'Osasuna', NULL, 3, 2, 64),
(2533, 'Barcelona', 'Levante', NULL, 0, 3, 65),
(2534, 'Rayo', 'Cádiz', NULL, 1, 3, 66),
(2535, 'R. Sociedad', 'Elche', NULL, 0, 1, 67),
(2536, 'Betis', 'Getafe', NULL, 0, 2, 68),
(2537, 'Celta', 'Granada', NULL, 0, 1, 69),
(2538, 'Athletic', 'Alavés', NULL, 0, 1, 70),
(2539, 'Osasuna', 'Rayo', NULL, 0, 1, 71),
(2540, 'Mallorca', 'Levante', NULL, 0, 1, 72),
(2541, 'Cádiz', 'Valencia', NULL, 0, 0, 73),
(2542, 'Atlético', 'Barcelona', NULL, 0, 2, 74),
(2543, 'Elche', 'Celta', NULL, 0, 1, 75),
(2544, 'Espanyol', 'Real Madrid', NULL, 1, 2, 76),
(2545, 'Getafe', 'R. Sociedad', NULL, 1, 1, 77),
(2546, 'Villarreal', 'Betis', NULL, 0, 2, 78),
(2547, 'Granada', 'Sevilla', NULL, 0, 1, 79),
(2548, 'Levante', 'Getafe', NULL, 0, 0, 80),
(2549, 'R. Sociedad', 'Mallorca', NULL, 0, 1, 81),
(2550, 'Rayo', 'Elche', NULL, 1, 2, 82),
(2551, 'Celta', 'Sevilla', NULL, 1, 0, 83),
(2552, 'Villarreal', 'Osasuna', NULL, 2, 1, 84),
(2553, 'Barcelona', 'Valencia', NULL, 1, 3, 85),
(2554, 'Alavés', 'Betis', NULL, 1, 0, 86),
(2555, 'Espanyol', 'Cádiz', NULL, 0, 2, 87),
(2556, 'Real Madrid', 'Athletic', NULL, 0, 1, 88),
(2557, 'Granada', 'Atlético', NULL, 1, 2, 89),
(2558, 'Osasuna', 'Granada', NULL, 1, 1, 90),
(2559, 'Valencia', 'Mallorca', NULL, 2, 2, 91),
(2560, 'Cádiz', 'Alavés', NULL, 2, 0, 92),
(2561, 'Elche', 'Espanyol', NULL, 2, 2, 93),
(2562, 'Athletic', 'Villarreal', NULL, 1, 2, 94),
(2563, 'Sevilla', 'Levante', NULL, 3, 5, 95),
(2564, 'Barcelona', 'Real Madrid', NULL, 2, 1, 96),
(2565, 'Betis', 'Rayo', NULL, 2, 3, 97),
(2566, 'Atlético', 'R. Sociedad', NULL, 2, 2, 98),
(2567, 'Getafe', 'Celta', NULL, 3, 0, 99),
(2568, 'Alavés', 'Elche', NULL, 0, 1, 100),
(2569, 'Espanyol', 'Athletic', NULL, 1, 1, 101),
(2570, 'Villarreal', 'Cádiz', NULL, 3, 3, 102),
(2571, 'Mallorca', 'Sevilla', NULL, 1, 1, 103),
(2572, 'Rayo', 'Barcelona', NULL, 0, 1, 104),
(2573, 'Betis', 'Valencia', NULL, 1, 4, 105),
(2574, 'Real Madrid', 'Osasuna', NULL, 0, 0, 106),
(2575, 'Celta', 'R. Sociedad', NULL, 2, 0, 107),
(2576, 'Granada', 'Getafe', NULL, 1, 1, 108),
(2577, 'Levante', 'Atlético', NULL, 2, 2, 109),
(2578, 'Elche', 'Real Madrid', NULL, 2, 1, 110),
(2579, 'Sevilla', 'Osasuna', NULL, 0, 2, 111),
(2580, 'Valencia', 'Villarreal', NULL, 0, 2, 112),
(2581, 'Barcelona', 'Alavés', NULL, 1, 1, 113),
(2582, 'Cádiz', 'Mallorca', NULL, 1, 1, 114),
(2583, 'Atlético', 'Betis', NULL, 0, 3, 115),
(2584, 'Getafe', 'Espanyol', NULL, 1, 2, 116),
(2585, 'R. Sociedad', 'Athletic', NULL, 1, 1, 117),
(2586, 'Rayo', 'Celta', NULL, 0, 0, 118),
(2587, 'Levante', 'Granada', NULL, 3, 0, 119),
(2588, 'Athletic', 'Cádiz', NULL, 1, 0, 120),
(2589, 'Espanyol', 'Granada', NULL, 0, 2, 121),
(2590, 'Celta', 'Barcelona', NULL, 3, 3, 122),
(2591, 'Alavés', 'Levante', NULL, 1, 2, 123),
(2592, 'Real Madrid', 'Rayo', NULL, 1, 2, 124),
(2593, 'Villarreal', 'Getafe', NULL, 0, 1, 125),
(2594, 'Valencia', 'Atlético', NULL, 3, 3, 126),
(2595, 'Mallorca', 'Elche', NULL, 2, 2, 127),
(2596, 'Osasuna', 'R. Sociedad', NULL, 2, 0, 128),
(2597, 'Betis', 'Sevilla', NULL, 2, 0, 129),
(2598, 'Levante', 'Athletic', NULL, 0, 0, 130),
(2599, 'Celta', 'Villarreal', NULL, 1, 1, 131),
(2600, 'Sevilla', 'Alavés', NULL, 2, 2, 132),
(2601, 'Atlético', 'Osasuna', NULL, 0, 1, 133),
(2602, 'Barcelona', 'Espanyol', NULL, 0, 1, 134),
(2603, 'Getafe', 'Cádiz', NULL, 0, 4, 135),
(2604, 'Granada', 'Real Madrid', NULL, 4, 1, 136),
(2605, 'Elche', 'Betis', NULL, 3, 0, 137),
(2606, 'R. Sociedad', 'Valencia', NULL, 0, 0, 138),
(2607, 'Rayo', 'Mallorca', NULL, 1, 3, 139),
(2608, 'Athletic', 'Granada', NULL, 2, 2, 140),
(2609, 'Alavés', 'Celta', NULL, 2, 1, 141),
(2610, 'Valencia', 'Rayo', NULL, 1, 1, 142),
(2611, 'Mallorca', 'Getafe', NULL, 0, 0, 143),
(2612, 'Villarreal', 'Barcelona', NULL, 3, 1, 144),
(2613, 'Betis', 'Levante', NULL, 1, 3, 145),
(2614, 'Espanyol', 'R. Sociedad', NULL, 0, 1, 146),
(2615, 'Cádiz', 'Atlético', NULL, 4, 1, 147),
(2616, 'Real Madrid', 'Sevilla', NULL, 1, 2, 148),
(2617, 'Osasuna', 'Elche', NULL, 1, 1, 149),
(2618, 'Granada', 'Alavés', NULL, 1, 2, 150),
(2619, 'Sevilla', 'Villarreal', NULL, 0, 1, 151),
(2620, 'Barcelona', 'Betis', NULL, 1, 0, 152),
(2621, 'Atlético', 'Mallorca', NULL, 2, 1, 153),
(2622, 'R. Sociedad', 'Real Madrid', NULL, 2, 0, 154),
(2623, 'Rayo', 'Espanyol', NULL, 0, 1, 155),
(2624, 'Elche', 'Cádiz', NULL, 1, 3, 156),
(2625, 'Levante', 'Osasuna', NULL, 0, 0, 157),
(2626, 'Celta', 'Valencia', NULL, 2, 1, 158),
(2627, 'Getafe', 'Athletic', NULL, 0, 0, 159),
(2628, 'Mallorca', 'Celta', NULL, 0, 0, 160),
(2629, 'Espanyol', 'Levante', NULL, 3, 4, 161),
(2630, 'Alavés', 'Getafe', NULL, 1, 1, 162),
(2631, 'Valencia', 'Elche', NULL, 1, 2, 163),
(2632, 'Athletic', 'Sevilla', NULL, 1, 0, 164),
(2633, 'Villarreal', 'Rayo', NULL, 0, 2, 165),
(2634, 'Osasuna', 'Barcelona', NULL, 2, 2, 166),
(2635, 'Betis', 'R. Sociedad', NULL, 0, 4, 167),
(2636, 'Real Madrid', 'Atlético', NULL, 0, 2, 168),
(2637, 'Cádiz', 'Granada', NULL, 1, 1, 169),
(2638, 'Celta', 'Espanyol', NULL, 1, 3, 170),
(2639, 'Rayo', 'Alavés', NULL, 0, 2, 171),
(2640, 'R. Sociedad', 'Villarreal', NULL, 3, 1, 172),
(2641, 'Barcelona', 'Elche', NULL, 2, 3, 173),
(2642, 'Sevilla', 'Atlético', NULL, 1, 2, 174),
(2643, 'Granada', 'Mallorca', NULL, 1, 4, 175),
(2644, 'Athletic', 'Betis', NULL, 2, 3, 176),
(2645, 'Getafe', 'Osasuna', NULL, 0, 1, 177),
(2646, 'Real Madrid', 'Cádiz', NULL, 0, 0, 178),
(2647, 'Levante', 'Valencia', NULL, 4, 3, 179),
(2648, 'Valencia', 'Espanyol', NULL, 2, 1, 180),
(2649, 'Getafe', 'Real Madrid', NULL, 0, 1, 181),
(2650, 'Atlético', 'Rayo', NULL, 0, 2, 182),
(2651, 'Elche', 'Granada', NULL, 0, 0, 183),
(2652, 'Alavés', 'R. Sociedad', NULL, 1, 1, 184),
(2653, 'Betis', 'Celta', NULL, 2, 0, 185),
(2654, 'Mallorca', 'Barcelona', NULL, 1, 0, 186),
(2655, 'Villarreal', 'Levante', NULL, 0, 5, 187),
(2656, 'Osasuna', 'Athletic', NULL, 3, 1, 188),
(2657, 'Cádiz', 'Sevilla', NULL, 1, 0, 189),
(2658, 'Levante', 'Mallorca', NULL, 0, 2, 190),
(2659, 'R. Sociedad', 'Celta', NULL, 0, 1, 191),
(2660, 'Granada', 'Barcelona', NULL, 1, 1, 192),
(2661, 'Real Madrid', 'Valencia', NULL, 1, 4, 193),
(2662, 'Rayo', 'Betis', NULL, 1, 1, 194),
(2663, 'Sevilla', 'Getafe', NULL, 0, 1, 195),
(2664, 'Alavés', 'Athletic', NULL, 0, 0, 196),
(2665, 'Osasuna', 'Cádiz', NULL, 0, 2, 197),
(2666, 'Villarreal', 'Atlético', NULL, 2, 2, 198),
(2667, 'Espanyol', 'Elche', NULL, 2, 1, 199),
(2668, 'Athletic', 'Real Madrid', NULL, 2, 1, 200),
(2669, 'Elche', 'Villarreal', NULL, 0, 1, 201),
(2670, 'Betis', 'Alavés', NULL, 0, 4, 202),
(2671, 'Cádiz', 'Espanyol', NULL, 2, 2, 203),
(2672, 'Celta', 'Osasuna', NULL, 0, 2, 204),
(2673, 'Barcelona', 'Rayo', 'Aplazado', -1, -1, 205),
(2674, 'Valencia', 'Sevilla', NULL, 1, 1, 206),
(2675, 'Getafe', 'Granada', NULL, 2, 4, 207),
(2676, 'Atlético', 'Levante', '16/02', -1, -1, 208),
(2677, 'Mallorca', 'R. Sociedad', '02/03', -1, -1, 209),
(2678, 'Espanyol', 'Betis', NULL, 4, 1, 210),
(2679, 'Levante', 'Cádiz', NULL, 2, 0, 211),
(2680, 'Villarreal', 'Mallorca', NULL, 0, 3, 212),
(2681, 'Sevilla', 'Celta', NULL, 2, 2, 213),
(2682, 'Atlético', 'Valencia', NULL, 2, 3, 214),
(2683, 'Granada', 'Osasuna', NULL, 2, 0, 215),
(2684, 'Real Madrid', 'Elche', NULL, 2, 2, 216),
(2685, 'Rayo', 'Athletic', NULL, 1, 0, 217),
(2686, 'R. Sociedad', 'Getafe', NULL, 0, 0, 218),
(2687, 'Alavés', 'Barcelona', NULL, 1, 0, 219),
(2688, 'Getafe', 'Levante', NULL, 0, 3, 220),
(2689, 'Elche', 'Alavés', NULL, 1, 3, 221),
(2690, 'Mallorca', 'Cádiz', NULL, 1, 2, 222),
(2691, 'Celta', 'Rayo', NULL, 0, 2, 223),
(2692, 'Osasuna', 'Sevilla', NULL, 0, 0, 224),
(2693, 'Valencia', 'R. Sociedad', NULL, 0, 0, 225),
(2694, 'Barcelona', 'Atlético', NULL, 2, 4, 226),
(2695, 'Betis', 'Villarreal', NULL, 2, 0, 227),
(2696, 'Real Madrid', 'Granada', NULL, 0, 1, 228),
(2697, 'Athletic', 'Espanyol', NULL, 1, 2, 229),
(2698, 'Sevilla', 'Elche', NULL, 0, 2, 230),
(2699, 'Cádiz', 'Celta', '12/02', -1, -1, 231),
(2700, 'Villarreal', 'Real Madrid', '12/02', -1, -1, 232),
(2701, 'Rayo', 'Osasuna', '12/02', -1, -1, 233),
(2702, 'Atlético', 'Getafe', '12/02', -1, -1, 234),
(2703, 'Alavés', 'Valencia', '13/02', -1, -1, 235),
(2704, 'Levante', 'Betis', '13/02', -1, -1, 236),
(2705, 'R. Sociedad', 'Granada', '13/02', -1, -1, 237),
(2706, 'Espanyol', 'Barcelona', '13/02', -1, -1, 238),
(2707, 'Mallorca', 'Athletic', '14/02', -1, -1, 239),
(2708, 'Elche', 'Rayo', '18/02', -1, -1, 240),
(2709, 'Granada', 'Villarreal', '19/02', -1, -1, 241),
(2710, 'Osasuna', 'Atlético', '19/02', -1, -1, 242),
(2711, 'Cádiz', 'Getafe', '19/02', -1, -1, 243),
(2712, 'Real Madrid', 'Alavés', '19/02', -1, -1, 244),
(2713, 'Espanyol', 'Sevilla', '20/02', -1, -1, 245),
(2714, 'Valencia', 'Barcelona', '20/02', -1, -1, 246),
(2715, 'Betis', 'Mallorca', '20/02', -1, -1, 247),
(2716, 'Athletic', 'R. Sociedad', '20/02', -1, -1, 248),
(2717, 'Celta', 'Levante', '21/02', -1, -1, 249),
(2718, 'Mallorca', 'Valencia', '25/02', -1, -1, 250),
(2719, 'Levante', 'Elche', '26/02', -1, -1, 251),
(2720, 'Getafe', 'Alavés', '26/02', -1, -1, 252),
(2721, 'Rayo', 'Real Madrid', '26/02', -1, -1, 253),
(2722, 'Atlético', 'Celta', '26/02', -1, -1, 254),
(2723, 'Villarreal', 'Espanyol', '27/02', -1, -1, 255),
(2724, 'Sevilla', 'Betis', '27/02', -1, -1, 256),
(2725, 'R. Sociedad', 'Osasuna', '27/02', -1, -1, 257),
(2726, 'Barcelona', 'Athletic', '27/02', -1, -1, 258),
(2727, 'Granada', 'Cádiz', '28/02', -1, -1, 259),
(2728, 'Alavés', 'Sevilla', '04/03', -1, -1, 260),
(2729, 'Osasuna', 'Villarreal', '05/03', -1, -1, 261),
(2730, 'Espanyol', 'Getafe', '05/03', -1, -1, 262),
(2731, 'Valencia', 'Granada', '05/03', -1, -1, 263),
(2732, 'Real Madrid', 'R. Sociedad', '05/03', -1, -1, 264),
(2733, 'Cádiz', 'Rayo', '06/03', -1, -1, 265),
(2734, 'Elche', 'Barcelona', '06/03', -1, -1, 266),
(2735, 'Celta', 'Mallorca', '06/03', -1, -1, 267),
(2736, 'Betis', 'Atlético', '06/03', -1, -1, 268),
(2737, 'Athletic', 'Levante', '07/03', -1, -1, 269),
(2738, 'Atlético', 'Cádiz', '13/03', -1, -1, 270),
(2739, 'Barcelona', 'Osasuna', '13/03', -1, -1, 271),
(2740, 'Getafe', 'Valencia', '13/03', -1, -1, 272),
(2741, 'Granada', 'Elche', '13/03', -1, -1, 273),
(2742, 'Levante', 'Espanyol', '13/03', -1, -1, 274),
(2743, 'Mallorca', 'Real Madrid', '13/03', -1, -1, 275),
(2744, 'Rayo', 'Sevilla', '13/03', -1, -1, 276),
(2745, 'Betis', 'Athletic', '13/03', -1, -1, 277),
(2746, 'R. Sociedad', 'Alavés', '13/03', -1, -1, 278),
(2747, 'Villarreal', 'Celta', '13/03', -1, -1, 279),
(2748, 'Alavés', 'Granada', '20/03', -1, -1, 280),
(2749, 'Athletic', 'Getafe', '20/03', -1, -1, 281),
(2750, 'Celta', 'Betis', '20/03', -1, -1, 282),
(2751, 'Cádiz', 'Villarreal', '20/03', -1, -1, 283),
(2752, 'Elche', 'Valencia', '20/03', -1, -1, 284),
(2753, 'Espanyol', 'Mallorca', '20/03', -1, -1, 285),
(2754, 'Osasuna', 'Levante', '20/03', -1, -1, 286),
(2755, 'Rayo', 'Atlético', '20/03', -1, -1, 287),
(2756, 'Real Madrid', 'Barcelona', '20/03', -1, -1, 288),
(2757, 'Sevilla', 'R. Sociedad', '20/03', -1, -1, 289),
(2758, 'Athletic', 'Elche', '03/04', -1, -1, 290),
(2759, 'Atlético', 'Alavés', '03/04', -1, -1, 291),
(2760, 'Barcelona', 'Sevilla', '03/04', -1, -1, 292),
(2761, 'Celta', 'Real Madrid', '03/04', -1, -1, 293),
(2762, 'Getafe', 'Mallorca', '03/04', -1, -1, 294),
(2763, 'Granada', 'Rayo', '03/04', -1, -1, 295),
(2764, 'Levante', 'Villarreal', '03/04', -1, -1, 296),
(2765, 'Betis', 'Osasuna', '03/04', -1, -1, 297),
(2766, 'R. Sociedad', 'Espanyol', '03/04', -1, -1, 298),
(2767, 'Valencia', 'Cádiz', '03/04', -1, -1, 299),
(2768, 'Cádiz', 'Betis', '10/04', -1, -1, 300),
(2769, 'Elche', 'R. Sociedad', '10/04', -1, -1, 301),
(2770, 'Espanyol', 'Celta', '10/04', -1, -1, 302),
(2771, 'Levante', 'Barcelona', '10/04', -1, -1, 303),
(2772, 'Mallorca', 'Atlético', '10/04', -1, -1, 304),
(2773, 'Osasuna', 'Alavés', '10/04', -1, -1, 305),
(2774, 'Rayo', 'Valencia', '10/04', -1, -1, 306),
(2775, 'Real Madrid', 'Getafe', '10/04', -1, -1, 307),
(2776, 'Sevilla', 'Granada', '10/04', -1, -1, 308),
(2777, 'Villarreal', 'Athletic', '10/04', -1, -1, 309),
(2778, 'Alavés', 'Rayo', '17/04', -1, -1, 310),
(2779, 'Athletic', 'Celta', '17/04', -1, -1, 311),
(2780, 'Atlético', 'Espanyol', '17/04', -1, -1, 312),
(2781, 'Barcelona', 'Cádiz', '17/04', -1, -1, 313),
(2782, 'Elche', 'Mallorca', '17/04', -1, -1, 314),
(2783, 'Getafe', 'Villarreal', '17/04', -1, -1, 315),
(2784, 'Granada', 'Levante', '17/04', -1, -1, 316),
(2785, 'R. Sociedad', 'Betis', '17/04', -1, -1, 317),
(2786, 'Sevilla', 'Real Madrid', '17/04', -1, -1, 318),
(2787, 'Valencia', 'Osasuna', '17/04', -1, -1, 319),
(2788, 'Atlético', 'Granada', '20/04', -1, -1, 320),
(2789, 'Celta', 'Getafe', '20/04', -1, -1, 321),
(2790, 'Cádiz', 'Athletic', '20/04', -1, -1, 322),
(2791, 'Espanyol', 'Rayo', '20/04', -1, -1, 323),
(2792, 'Levante', 'Sevilla', '20/04', -1, -1, 324),
(2793, 'Mallorca', 'Alavés', '20/04', -1, -1, 325),
(2794, 'Osasuna', 'Real Madrid', '20/04', -1, -1, 326),
(2795, 'Betis', 'Elche', '20/04', -1, -1, 327),
(2796, 'R. Sociedad', 'Barcelona', '20/04', -1, -1, 328),
(2797, 'Villarreal', 'Valencia', '20/04', -1, -1, 329),
(2798, 'Alavés', 'Villarreal', '01/05', -1, -1, 330),
(2799, 'Athletic', 'Atlético', '01/05', -1, -1, 331),
(2800, 'Barcelona', 'Mallorca', '01/05', -1, -1, 332),
(2801, 'Elche', 'Osasuna', '01/05', -1, -1, 333),
(2802, 'Getafe', 'Betis', '01/05', -1, -1, 334),
(2803, 'Granada', 'Celta', '01/05', -1, -1, 335),
(2804, 'Rayo', 'R. Sociedad', '01/05', -1, -1, 336),
(2805, 'Real Madrid', 'Espanyol', '01/05', -1, -1, 337),
(2806, 'Sevilla', 'Cádiz', '01/05', -1, -1, 338),
(2807, 'Valencia', 'Levante', '01/05', -1, -1, 339),
(2808, 'Athletic', 'Valencia', '08/05', -1, -1, 340),
(2809, 'Atlético', 'Real Madrid', '08/05', -1, -1, 341),
(2810, 'Celta', 'Alavés', '08/05', -1, -1, 342),
(2811, 'Cádiz', 'Elche', '08/05', -1, -1, 343),
(2812, 'Espanyol', 'Osasuna', '08/05', -1, -1, 344),
(2813, 'Getafe', 'Rayo', '08/05', -1, -1, 345),
(2814, 'Levante', 'R. Sociedad', '08/05', -1, -1, 346),
(2815, 'Mallorca', 'Granada', '08/05', -1, -1, 347),
(2816, 'Betis', 'Barcelona', '08/05', -1, -1, 348),
(2817, 'Villarreal', 'Sevilla', '08/05', -1, -1, 349),
(2818, 'Alavés', 'Espanyol', '11/05', -1, -1, 350),
(2819, 'Barcelona', 'Celta', '11/05', -1, -1, 351),
(2820, 'Elche', 'Atlético', '11/05', -1, -1, 352),
(2821, 'Granada', 'Athletic', '11/05', -1, -1, 353),
(2822, 'Osasuna', 'Getafe', '11/05', -1, -1, 354),
(2823, 'Rayo', 'Villarreal', '11/05', -1, -1, 355),
(2824, 'Real Madrid', 'Levante', '11/05', -1, -1, 356),
(2825, 'R. Sociedad', 'Cádiz', '11/05', -1, -1, 357),
(2826, 'Sevilla', 'Mallorca', '11/05', -1, -1, 358),
(2827, 'Valencia', 'Betis', '11/05', -1, -1, 359),
(2828, 'Athletic', 'Osasuna', '15/05', -1, -1, 360),
(2829, 'Atlético', 'Sevilla', '15/05', -1, -1, 361),
(2830, 'Celta', 'Elche', '15/05', -1, -1, 362),
(2831, 'Cádiz', 'Real Madrid', '15/05', -1, -1, 363),
(2832, 'Espanyol', 'Valencia', '15/05', -1, -1, 364),
(2833, 'Getafe', 'Barcelona', '15/05', -1, -1, 365),
(2834, 'Levante', 'Alavés', '15/05', -1, -1, 366),
(2835, 'Mallorca', 'Rayo', '15/05', -1, -1, 367),
(2836, 'Betis', 'Granada', '15/05', -1, -1, 368),
(2837, 'Villarreal', 'R. Sociedad', '15/05', -1, -1, 369),
(2838, 'Alavés', 'Cádiz', '22/05', -1, -1, 370),
(2839, 'Barcelona', 'Villarreal', '22/05', -1, -1, 371),
(2840, 'Elche', 'Getafe', '22/05', -1, -1, 372),
(2841, 'Granada', 'Espanyol', '22/05', -1, -1, 373),
(2842, 'Osasuna', 'Mallorca', '22/05', -1, -1, 374),
(2843, 'Rayo', 'Levante', '22/05', -1, -1, 375),
(2844, 'Real Madrid', 'Betis', '22/05', -1, -1, 376),
(2845, 'R. Sociedad', 'Atlético', '22/05', -1, -1, 377),
(2846, 'Sevilla', 'Athletic', '22/05', -1, -1, 378),
(2847, 'Valencia', 'Celta', '22/05', -1, -1, 379);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `teamname` varchar(50) NOT NULL,
  `visit_won` int(11) DEFAULT NULL,
  `visit_lost` int(11) DEFAULT NULL,
  `tendency` varchar(2) DEFAULT '',
  `local_won` int(11) DEFAULT NULL,
  `local_lost` int(11) DEFAULT NULL,
  `visit_game` int(11) DEFAULT NULL,
  `local_game` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `teamname`, `visit_won`, `visit_lost`, `tendency`, `local_won`, `local_lost`) VALUES
(1, 'Valencia', 16, 22, '', 17, 13),
(2, 'Cádiz', 11, 20, '', 7, 16),
(3, 'Mallorca', 9, 25, '', 9, 8),
(4, 'Alavés', 9, 24, '', 7, 10),
(5, 'Osasuna', 12, 11, '', 10, 16),
(6, 'Celta', 13, 10, '', 14, 13),
(7, 'Barcelona', 12, 11, '', 19, 11),
(8, 'Sevilla', 9, 6, '', 23, 10),
(9, 'Villarreal', 9, 10, '', 29, 13),
(10, 'Elche', 13, 21, '', 13, 11),
(11, 'Betis', 17, 12, '', 22, 12),
(12, 'Espanyol', 11, 19, '', 16, 13),
(13, 'Granada', 10, 13, '', 15, 16),
(14, 'Athletic', 8, 5, '', 14, 12),
(15, 'R. Sociedad', 13, 11, '', 6, 6),
(16, 'Atlético', 19, 21, '', 16, 8),
(17, 'Levante', 9, 28, '', 8, 14),
(18, 'Getafe', 3, 11, '', 17, 10),
(19, 'Rayo', 7, 15, '', 16, 5),
(20, 'Real Madrid', 15, 8, '', 25, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `money` int(11) NOT NULL, 
  `bets_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`bet_id`),
  ADD KEY `user_id` (`user_id`,`game_id`),
  ADD KEY `fk_game_key` (`game_id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`),
  ADD KEY `local` (`local`,`visitor`),
  ADD KEY `fk_visitor_key` (`visitor`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `teamname_2` (`teamname`),
  ADD KEY `teamname` (`teamname`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bets`
--
ALTER TABLE `bets`
  MODIFY `bet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2848;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bets`
--
ALTER TABLE `bets`
  ADD CONSTRAINT `fk_game_key` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `fk_local_key` FOREIGN KEY (`local`) REFERENCES `teams` (`teamname`),
  ADD CONSTRAINT `fk_visitor_key` FOREIGN KEY (`visitor`) REFERENCES `teams` (`teamname`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
