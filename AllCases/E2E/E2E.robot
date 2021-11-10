*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${url}  http://thetestingworldapi.com/
${original_name}  hello
${Update_name}  Tesingworld

*** Test Cases ***
TC1_E2E_Test
        create session  E2E_Data  ${url}
        &{body}=  create dictionary  first_name=${original_name}  middle_name=Data  last_name=World  date_of_birth=7/11/2021
        ${post_response}=  post on session  E2E_Data  api/studentsDetails  data=${body}
        #Log To console  ${Post_response.status_code}
        ${json_response}=  to json  ${Post_response.content}
        @{id_list}=  get value from json  ${json_response}  id
        Log To Console  ${id_list}
        ${id}=  get from list  ${id_list}  0
        Log To Console  ${id}

        &{body1}=  create dictionary  id=${id}  first_name=${Update_name}  middle_name=Data  last_name=World  date_of_birth=7/11/2021
        ${put_response}=  put on session  E2E_Data  api/studentsDetails/${id}  data=${body1}
        Log To Console  ${put_response.status_code}
        Log To Console  ${put_response.content}

        Fectching Details  ${id}

        ${Del_request}=  delete on session  E2E_Data  api/studentsDetails/${id}
        #Log To Console  ${Del_request.status_code}
        ${Del_json}=  to json  ${Del_request.content}
        @{Message}=  get value from json  ${Del_json}  status
        ${id_num}=  get from list  ${Message}  0
        should be equal  ${id_num}  true

*** Keywords ***
Fectching Details
    [Arguments]  ${id}
     ${get_request}=  get on session  E2E_Data  api/studentsDetails/${id}
     ${json_response}=  to json  ${get_request.content}
     @{Lfirst_name}=  get value from json  ${json_response}  data.first_name
     ${first_name}=  get from list  ${Lfirst_name}  0
     should be equal  ${first_name}  ${Update_name}