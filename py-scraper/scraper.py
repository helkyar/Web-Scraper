from selenium import webdriver

url = 'https://www.google.com/search?client=firefox-b-d&q=liga+espa%C3%B1ola#cobssid=s&sie=lg;/g/11mqlmppsd;2;/m/09gqx;mt;fp;1;;'
browser = webdriver.Chrome()
browser.get(url)
browser.find_element_by_xpath('/html/body/div[2]/div/a[2]').click()