import investpy
import yfinance as yf
import matplotlib.pyplot as plt

# 미국 달러 인덱스 데이터 가져오기
try:
    us_dollar_index = yf.Ticker("DXY").history(start="2022-06-01", end="2023-05-30")
except Exception as e:
    print(f"Error while fetching data for ^DXY: {e}")

# 대한민국의 코스피 데이터 가져오기
try:
    kosdaq = yf.Ticker("KS11").history(start="2022-06-01", end="2023-05-30")
except Exception as e:
    print(f"Error while fetching data for KS11: {e}")

# 두 데이터를 겹쳐서 그리기
if 'us_dollar_index' in locals() and 'kosdaq' in locals():
    plt.plot(us_dollar_index["Close"], label="US Dollar Index", color="pink", linewidth=2)
    plt.plot(kosdaq["Close"], label="KOSPI", color="green", linewidth=2)
    plt.legend()
    plt.show()
else:
    print("Could not plot chart due to missing data.")