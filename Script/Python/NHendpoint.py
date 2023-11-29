#Note: The openai-python library support for Azure OpenAI is in preview.
      #Note: This code sample requires OpenAI Python library version 0.28.1 or lower.
import os
import openai
from azure.identity import DefaultAzureCredential

credential = DefaultAzureCredential()
access_token = credential.get_token("https://cognitiveservices.azure.com/.default")
openai.api_type = "azure"
openai.api_base = "http://nhaiaccount04.openai.azure.com/"
openai.api_version = "2023-07-01-preview"
# openai.api_key = os.getenv("OPENAI_API_KEY")
openai.api_key = access_token.token

message_text = [{"role":"system","content":"You are an AI assistant that helps people find information."},{"role":"user","content":"안녕?"}]

completion = openai.ChatCompletion.create(
  engine="gpt-35-turbo-16k-jpn",
  messages = message_text,
  temperature=0.7,
  max_tokens=800,
  top_p=0.95,
  frequency_penalty=0,
  presence_penalty=0,
  stop=None
)