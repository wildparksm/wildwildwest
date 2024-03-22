import pandas as pd
import yfinance as yf
from pyti.relative_strength_index import relative_strength_index as rsi

# 주식 데이터 다운로드
data = yf.download('300120.KQ', start='2021-01-01', end='2024-01-16')

# RSI 계산
data['RSI'] = rsi(data['Close'].values, 14)

# 매매 전략
data['Buy_Signal'] = (data['RSI'] < 30)
data['Sell_Signal'] = (data['RSI'] > 70)

# 매매 신호 출력
print(data)