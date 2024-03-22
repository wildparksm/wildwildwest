from talib import MACD

# MACD 지표 계산
macd, macd_signal, macd_hist = MACD(close=prices, fastperiod=12, slowperiod=26, signalperiod=9)

# MACD 선이 신호선 위로 교차하는 종목 찾기
for i in range(len(prices)):
    if macd[i] > macd_signal[i] and macd[i - 1] < macd_signal[i - 1]:
        print(f"종목: {symbol}, 날짜: {dates[i]}")