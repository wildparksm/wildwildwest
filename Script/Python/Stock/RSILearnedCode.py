import yfinance as yf
import pandas as pd
import numpy as np

# 대한민국 상장주식 목록 가져오기
kr_stocks = ['005930.KS', '000660.KS', '035420.KS']  # 삼성전자, SK하이닉스, NAVER

# RSI가 30 이하인 종목들을 저장할 빈 데이터프레임 생성
rsi_30_df = pd.DataFrame(columns=['Stock', 'RSI', 'Price'])

# 각 종목에 대해 RSI 계산하고 30 이하인지 확인
for stock in kr_stocks:
    # 종목의 주가 데이터 가져오기
    data = yf.download(stock, period='1mo')
    # 종가 컬럼만 선택
    close = data['Close']
    # 종가의 변화량 계산
    delta = close.diff()
    # 변화량의 양수값과 음수값을 나누어 저장
    up = delta.clip(lower=0)
    down = -delta.clip(upper=0)
    # 14일 이동평균 구하기
    ma_up = up.rolling(14).mean()
    ma_down = down.rolling(14).mean()
    # RS와 RSI 계산
    rs = ma_up / ma_down
    rsi = 100 - 100 / (1 + rs)
    # RSI의 마지막 값이 30 이하이면 데이터프레임에 추가
    if rsi[-1] <= 30:
        rsi_30_df = rsi_30_df.append({'Stock': stock, 'RSI': rsi[-1], 'Price': close[-1]}, ignore_index=True)

# 데이터프레임을 테이블로 출력
print(rsi_30_df)
