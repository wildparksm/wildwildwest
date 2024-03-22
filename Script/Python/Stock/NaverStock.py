# 필요한 모듈 임포트
import requests
import pandas as pd
# RSI와 프로그램 매수 동향 데이터를 가져오는 함수
def get_data():
   # RSI 데이터를 가져오는 API 주소
   rsi_url = "https://api.finance.naver.com/service/itemSummary.nhn?itemcode="
   # 프로그램 매수 동향 데이터를 가져오는 웹사이트 주소
   program_url = "https://finance.naver.com/sise/programDealTrendTime.nhn"
   # 코스피 시장의 종목 코드를 가져오는 웹사이트 주소
   kospi_url = "https://finance.naver.com/sise/sise_market_sum.nhn?sosok=0"
   # 코스피 시장의 종목 코드를 저장할 리스트
   kospi_codes = []
   # RSI와 프로그램 매수 동향 데이터를 저장할 데이터프레임
   df = pd.DataFrame(columns=["종목명", "종목코드", "RSI", "프로그램 매수"])
   # 코스피 시장의 종목 코드를 가져오는 웹사이트에서 테이블을 읽어옴
   kospi_table = pd.read_html(kospi_url, encoding="euc-kr")[1]
   # 테이블에서 종목 코드만 추출하여 리스트에 추가
   for code in kospi_table["종목코드"]:
       kospi_codes.append(code)
   # 코스피 시장의 모든 종목에 대해 반복
   for code in kospi_codes:
       # RSI 데이터를 가져오는 API에 요청을 보냄
       rsi_response = requests.get(rsi_url + code)
       # 요청이 성공적이면
       if rsi_response.status_code == 200:
           # 응답을 JSON 형식으로 변환
           rsi_data = rsi_response.json()
           # 종목명과 RSI 값을 변수에 저장
           name = rsi_data["name"]
           rsi = rsi_data["rsi"]
       # 요청이 실패하면
       else:
           # 종목명과 RSI 값을 None으로 저장
           name = None
           rsi = None
       # 프로그램 매수 동향 데이터를 가져오는 웹사이트에 요청을 보냄
       program_response = requests.get(program_url, params={"code": code})
       # 요청이 성공적이면
       if program_response.status_code == 200:
           # 응답을 텍스트 형식으로 변환
           program_data = program_response.text
           # 텍스트에서 프로그램 매수 금액을 추출
           program_buy = program_data.split("var data = ")[1].split(";")[0].split(",")[1]
       # 요청이 실패하면
       else:
           # 프로그램 매수 금액을 None으로 저장
           program_buy = None
       # 데이터프레임에 종목명, 종목코드, RSI, 프로그램 매수를 추가
       df = df.append({"종목명": name, "종목코드": code, "RSI": rsi, "프로그램 매수": program_buy}, ignore_index=True)
   # 데이터프레임을 반환
   return df
# RSI와 프로그램 매수 동향 데이터를 가져옴
df = get_data()
# RSI가 30 이하이고 프로그램 매수가 양수인 종목을 필터링
filtered_df = df[(df["RSI"] <= 30) & (df["프로그램 매수"] > 0)]
# 필터링된 종목을 출력
print(filtered_df)
