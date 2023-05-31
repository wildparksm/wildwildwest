import requests
import matplotlib.pyplot as plt

# 환율 API URL
url_exchange = "https://api.investing.com/api/v1/get_chart_data.json?symbol=EURUSD&interval=15&from_date=2023-05-29&to_date=2023-06-01"

# 코스피 API URL
url_kosdaq = "https://api.investing.com/api/v1/get_chart_data.json?symbol=KS11&interval=15&from_date=2023-05-29&to_date=2023-06-01"

# 환율 API 요청
response_exchange = requests.get(url_exchange)

# 코스피 API 요청
response_kosdaq = requests.get(url_kosdaq)

# 환율 데이터 추출
exchange_data = response_exchange.json()["Data"]

# 코스피 데이터 추출
kosdaq_data = response_kosdaq.json()["Data"]

# 환율 데이터 시각화
plt.plot(exchange_data["Date"], exchange_data["Close"])
plt.title("EURUSD Exchange Rate")
plt.xlabel("Date")
plt.ylabel("Price")
plt.show()

# 코스피 데이터 시각화
plt.plot(kosdaq_data["Date"], kosdaq_data["Close"])
plt.title("KOSPI Index")
plt.xlabel("Date")
plt.ylabel("Price")
plt.show()
