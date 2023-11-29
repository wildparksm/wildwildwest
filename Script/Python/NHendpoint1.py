import openai
from openai import AzureOpenAI
import azure
from azure.identity import DefaultAzureCredential

# Define strategy which potential authentication methods should be tried to gain an access token
credential = DefaultAzureCredential()
access_token = credential.get_token("https://cognitiveservices.azure.com/.default") # <-- 수정된 부분

# Configure OpenAI SDK to use the access token
# TODO: The 'openai.api_base' option isn't read in the client API. You will need to pass it when you instantiate the client, e.g. 'OpenAI(api_base='http://nhai.privatelink.openai.azure.com')'
# openai.api_base = 'http://nhai.privatelink.openai.azure.com'
#openai.api_base = 'http://pkh.eastus2.cloudapp.azure.com/' # agw 프론트 사설ip의 a레코드 입력

deployment = "gpt-35-turbo-16k"

# client = AzureOpenAI(api_version="2023-11-17-preview",
# api_key=access_token.token) # <-- 수정된 부분

client = AzureOpenAI(api_version="2023-11-17-preview",
api_key=access_token.token,
base_url="http://nhai.privatelink.openai.azure.com") # <-- 수정된 부분


# Example OpenAI Python library request
response = client.chat.completions.create(model="gpt-35-turbo-16k",
messages=[
  {"role": "system", "content": "나는 유치원 선생님입니다. 아이들이 이해할 수 있게 쉬운 예를 들어 설명해주세요."},
  #{"role": "user", "content": "Explain asynchronous programming in the style of the pirate Blackbeard."},
  {"role": "user", "content": "Asynchronous programming에 대해 설명해줘."},
],
temperature=0)

content = response['choices'][0]['message']['content']

print(content)
