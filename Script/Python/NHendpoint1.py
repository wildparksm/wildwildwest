import openai
 
# Define strategy which potential authentication methods should be tried to gain an access token
#credential = DefaultAzureCredential()
 
openai.api_type = "azure"
openai.api_base = "https://nhaiaccjpn01.openai.azure.com/"
openai.api_version = "2023-07-01-preview"
openai.api_key = "9bb6d9f2f1c94185b8eff4528ccd1ff2"

deployment = "nhaiaccjpn01-35-turbo-16k"

# Example OpenAI Python library request
 
response = openai.ChatCompletion.create(
    engine="nhaiaccjpn01-35-turbo-16k",
    messages=[
        {"role": "user", "content": "What do you think about ai"},
    ],
    temperature=0,
)
 
content = response['choices'][0]['message']['content']
 
print(content)