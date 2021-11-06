*** Settings ***
Library  RequestsLibrary

*** Variable ***
${Url}  http://thetestingworldapi.com/

*** Test Cases ***
TC1Request
    create session  Get_Student_Details  ${Url}
    ${response}=  GET On Session  Get_Student_Details  api/studentsDetails
    #Log To Console  ${response}
    Log To Console  ${response.status_code}
    Log To Console  ${response.content}
