*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variable ***
${Url}  http://thetestingworldapi.com/
${Stu_ID}  527479
${apiresponsestatus}  false

*** Test Cases ***
TC1_Student_Details
    [Tags]  Smoke
    create session  Student_Data  ${Url}
    ${Response}=  get on session  Student_Data  api/studentsDetails/${Stu_ID}
    ${actual_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_code}  200
    ${json_res}=  to json  ${Response.content}
    @{httpStatus}=  get value from json  ${json_res}  $.status
    ${status_list}=  get from list  ${httpStatus}  0
    IF  '${status_list}' == 'false'
    Log To Console  No Record Found with Student ID
    ELSE
    @{first_name}=  get value from json  ${json_res}  data.first_name
    ${first_list}=  get from list  ${first_name}  0
    Log To Console  ${first_list}
    should be equal  ${first_list}  Testing
    @{middle_name}=  get value from json  ${json_res}  data.middle_name
    Log To Console  ${Response.content}
    ${middle_list}=  get from list  ${middle_name}  0
    Log To Console  ${middle_list}
    should be equal  ${middle_list}  Data
    END

