from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
import time
from selenium.webdriver.common.keys import Keys
import pandas as pd


# WebDriver 인스턴스 생성
driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))
driver.get('https://tdg.crm5.dynamics.com/main.aspx?appid=b484f1b8-fa18-eb11-a813-000d3a854084&forceUCI=1&pagetype=entityrecord&etn=serviceappointment')
time.sleep(3) 

# 로그인 ID 입력 후 엔터
email_field = driver.find_element(By.XPATH, '//*[@id="i0116"]')
email_field.click()
time.sleep(1) 

# 한 글자씩 입력
email = 'parksm@tdgl.co.kr'
for char in email:
    email_field.send_keys(char)
    time.sleep(0.1) 

# 마지막에 엔터 입력
email_field.send_keys(Keys.RETURN)
time.sleep(2)


# 비밀번호 입력
password_field = driver.find_element(By.XPATH, '//*[@id="i0118"]')
password_field.click()
time.sleep(1)  

# 한 글자씩 입력
password = 'Qkrtkdals1!'
for char in password:
    password_field.send_keys(char)
    time.sleep(0.1)  

# 마지막에 엔터 입력
password_field.send_keys(Keys.RETURN)
time.sleep(8)



