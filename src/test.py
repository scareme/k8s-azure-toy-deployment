import json
import requests

# test_api_url = "http://127.0.0.1:5001/"
test_api_url = "http://webserver.io/api/v1/service/toy/"


api_call_headers=None
# api_call_headers = {'Authorization': 'Bearer ' + token}
api_call_response = requests.get(test_api_url, headers=api_call_headers)
print(api_call_response.text)

with open("resources/input.json", "r") as file:
    data = json.load(file)
api_call_response = requests.post(test_api_url+"score", headers=api_call_headers, json=data)
print(api_call_response.content)
