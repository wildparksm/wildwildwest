import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))
driver.get('https://tdg.crm5.dynamics.com/main.aspx?appid=b484f1b8-fa18-eb11-a813-000d3a854084&forceUCI=1&pagetype=entityrecord&etn=serviceappointment')
time.sleep(2)


def click1():
    global driver
    # Assuming '//*[@id="i0116"]' is the correct XPATH for the email input field
    email_field = driver.find_element(By.XPATH, '//*[@id="i0116"]')
    email_field.click()

def enter_email():
    global driver
    email_field = driver.find_element(By.XPATH, '//*[@id="i0116"]')
    email_field.clear()  # Clear the input field before entering the email
    email_field.send_keys('aaa@bbb.com')
    time.sleep(80)  # Wait for 2 seconds



# def enter_email():
#     global driver
#     email_input = driver.find_element(By.XPATH, '//*[@id="i0116"]')  # Assuming this is the XPATH for the email input field
#     email_input.send_keys('aaa@aaa.com')
#     email_input.
#     time.sleep(2)
# //*[@id="id-02802e2d-efa8-4d5f-ae3e-d2d907d72b14-1-new_l_servicecase270bd3db-d9af-4782-9025-509e298dec0a-new_l_servicecase.fieldControl-LookupResultsDropdown_new_l_servicecase_0_textInputBox_with_filter_new"]