# 데이터 수집
from datetime import datetime, timedelta
import yfinance as yf
import pandas as pd

tickers = ["005930.KS", "000660.KS"]  # 예시 종목코드

# 7일치 데이터 요청
end_date = datetime.now()
start_date = end_date - timedelta(days=7)
data = yf.download(tickers, start=start_date, end=end_date, interval="1m")

# RSI 계산 함수
def rsi(prices, period=14):
    ...

# 최저가 종목 검색
def find_lowest(data):
    lowest_price = data.Low.min()
    lowest_ticker = data[data.Low == lowest_price].index.get_level_values(0)[0]
    return lowest_ticker

# 매수 조건 충족 시 주문 실행 (모의투자)
def order_buy(ticker):
    ...

# 매도 조건 충족 시 주문 실행 (모의투자)
def order_sell(ticker, target_rsi):
    ...

# 메인 로직
today = data.index.max().date()  # 데이터 프레임의 최근 날짜 사용
lowest_ticker = find_lowest(data.loc[str(today)])  # 일별 데이터로 최저가 종목 검색
buy_signal = order_buy(lowest_ticker)

if buy_signal:
    target_rsi = 70  # 매도 RSI 목표치
    sell_signal = order_sell(lowest_ticker, target_rsi)