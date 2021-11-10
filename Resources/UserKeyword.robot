*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  ../AllCases/E2E/Validatejson.py

*** Variables ***
${Url}  https://thetestingworld.com/

*** Keywords ***
Fetch_The_Details
    [Arguments]  ${Stu_id}  ${Status_code}
    create session  Stu_data  ${Url}
    ${response}=  get on session  Stu_data  api/studentsDetails/${Stu_id}
    ${status}=  convert to string  ${response.status_code}
    should be equal  ${Status_code}  ${Status}

Fetch_Return_Data
    [Arguments]  ${Stu_id}
    create session  Stu_data  ${Url}
    ${response}=  get on session  Stu_data  api/studentsDetails/${Stu_id}
    [Return]  ${response}


Fetch_json
    ${json-data}=  read_request_data
    [Return]  ${json-data}
Welcome User
    [Documentation]  This is starting one
    Log To console  This is my page

End User
    [Documentation]  This is Ending
    Log To console  This is my end page


