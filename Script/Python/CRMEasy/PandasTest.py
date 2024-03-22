from office365.runtime.auth.authentication_context import AuthenticationContext
from office365.sharepoint.client_context import ClientContext
from office365.sharepoint.files.file import File
import io
import pandas as pd

# SharePoint URL 및 사용자 인증 정보
url = 'https://techdataglobal.sharepoint.com/:x:/r/sites/AzureDataDev/_layouts/15/Doc2.aspx?action=edit&sourcedoc=%7Ba8d89259-c8c3-4424-b517-b9f289b3faab%7D&wdOrigin=TEAMS-MAGLEV.teamsSdk_ns.rwc&wdExp=TEAMS-TREATMENT&wdhostclicktime=1702363548558&web=1'
username = 'parksm@tdgl.co.kr'  # 실제 사용자 이름으로 변경해주세요
password = 'Qkrtkdals1!'  # 실제 비밀번호로 변경해주세요

# SharePoint 인증
ctx_auth = AuthenticationContext(url)
if ctx_auth.acquire_token_for_user(username, password):
    ctx = ClientContext(url, ctx_auth)
    print("Authentication successful")

    # 파일을 바이너리 형태로 가져오기
    response = File.open_binary(ctx, url)

    # 데이터를 BytesIO 스트림에 저장
    bytes_file_obj = io.BytesIO()
    bytes_file_obj.write(response.content)
    bytes_file_obj.seek(0)  # 파일 객체를 시작으로 설정

    # pandas dataframe으로 읽기
    df = pd.read_excel(bytes_file_obj)
else:
    print("Authentication failed")
