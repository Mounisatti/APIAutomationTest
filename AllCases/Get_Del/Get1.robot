*** Settings ***
Library  RequestsLibrary

*** Variable ***
${Url}  http://thetestingworldapi.com/

*** Test Cases ***
TC1Request
    [Tags]  Smoke  Sanity
    create session  Get_Tech_Details  ${Url}
    ${response}=  GET On Session  Get_Tech_Details  api/technicalskills
    #Log To Console  ${response}
    Log To Console  ${response.status_code}
    Log To Console  ${response.content}
