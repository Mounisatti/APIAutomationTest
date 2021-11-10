import json

def  read_request_data():
    file = open('C:/Users/user/Desktop/Request.json', 'r')
    jsonfile = file.read()
    json_content = json.loads(jsonfile)
    return json_content

x=read_request_data()
print(x)

