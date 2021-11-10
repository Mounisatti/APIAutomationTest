*** Settings ***
Library  RequestsLibrary

*** Variable ***
${url}  http://thetestingworldapi.com/
${Stu_ID}  526792

*** Test Cases ***
TC1_Student_ID
    create session  Student_ID  ${url}
    ${response}=  get on session  Student_ID  api/studentsDetails/${Stu_ID}
    #Log To Console  ${response.status_code}
    #Log To Console  ${response.content}
    ${actual_code}  convert to string  ${response.status_code}
    should be equal  ${actual_code}  200

