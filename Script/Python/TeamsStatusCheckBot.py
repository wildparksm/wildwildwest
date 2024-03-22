import schedule
import time
from datetime import datetime
import requests
from microsoftgraphapi import Message


# 코스피 지수 가져오기 함수
def get_kospi_index():
    url = "https://api.finance.naver.com/siseJson.nhn?symbol=KOSPI&requestType=1"
    
    response = requests.get(url)
    data = response.json()
    kospi_index = data["market_sum"]["market_nav"]
    return kospi_index

# 메시지 전송 함수
def send_message(chat_id, message_content):
    message = Message(chat_id=chat_id, body={"body": {"content": message_content}})
    message.send()  # Graph API 호출하여 메시지 전송

# 메시지 생성 및 전송 함수
def send_time_and_kospi(chat_id):
    current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    kospi_index = get_kospi_index()
    message_content = f"현재 시간: {current_time}\n코스피 지수: {kospi_index}"
    send_message(chat_id, message_content)

# 스케줄링 설정
chat_id = "parksm@tdgl.co.kr"  # 메시지를 보낼 대화 상대 ID
schedule.every(5).minutes.do(send_time_and_kospi, chat_id)

while True:
    schedule.run_pending()
    time.sleep(1)