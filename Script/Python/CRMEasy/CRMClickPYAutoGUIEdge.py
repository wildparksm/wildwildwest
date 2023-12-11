import pyautogui
import webbrowser
import time
import pyperclip


# 웹 브라우저를 열고 특정 URL로 이동
url = 'https://tdg.crm5.dynamics.com/main.aspx?appid=b484f1b8-fa18-eb11-a813-000d3a854084&forceUCI=1&pagetype=entityrecord&etn=serviceappointment'
webbrowser.open(url)
# 웹 페이지가 로드되는 동안 잠시 대기
time.sleep(5)

# 서비스 케이스
pyautogui.moveTo(2958, 393)
pyautogui.click()
pyautogui.moveTo(4658, 420)
pyautogui.click()
pyperclip.copy('[삼성전기] 인도법인 VDI 내부지원')
pyautogui.hotkey('ctrl', 'v')
time.sleep(2)
# pyautogui.press('enter')
pyautogui.moveTo(3078, 469)
pyautogui.click(button='left')
# 제목
pyautogui.moveTo(2960, 450)
pyautogui.click(button='left')
pyperclip.copy('[삼성전기] 인도법인 VDI 운영 지원')
pyautogui.hotkey('ctrl', 'v')
time.sleep(2)

pyautogui.moveTo(3975, 583)
pyautogui.click(button='left')
pyperclip.copy('480')
pyautogui.hotkey('ctrl', 'v')

pyautogui.moveTo(2948, 773)
pyautogui.click(button='left')

# 업무유형
time.sleep(1)
pyautogui.moveTo(3231, 888)
pyautogui.click(button='left')
pyautogui.click(button='left')
pyautogui.moveTo(2976, 404)
pyautogui.click(button='left')