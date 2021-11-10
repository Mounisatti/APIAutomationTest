*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variable ***
${Url}  http://thetestingworldapi.com/
${Stu_ID}  526996

*** Test Cases ***
TC1_Student_Details
    create session  Student_Data  ${Url}
    ${Response}=  get on session  Student_Data  api/studentsDetails/${Stu_ID}
    ${actual_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_code}  200
    ${json_res}=  to json  ${Response.content}
    @{first_name}=  get value from json  ${json_res}  data.first_name
    #Log To Console  ${Response.content}
    ${first_list}=  get from list  ${first_name}  0
    Log To Console  ${first_list}
    should be equal  ${first_list}  sample string 2
    @{middle_name}=  get value from json  ${json_res}  data.middle_name
    #Log To Console  ${Response.content}
    ${middle_list}=  get from list  ${middle_name}  0
    Log To Console  ${middle_list}
    should be equal  ${middle_list}  sample string 3
