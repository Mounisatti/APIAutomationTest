*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Url}  http://thetestingworldapi.com/
${Stu_ID}  21625

*** Test Cases ***
Test_Delete
    [Tags]  Sanity
    [Documentation]  This testcase is created on delete request
    #[Timeout]  2s
    create session  Del_ID  ${url}
    ${response}=  delete on session  Del_ID  api/studentsDetails/${Stu_ID}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    ${jsonresponse}=  to json  ${response.content}
    @{status_list}=  get value from json  ${jsonresponse}  status
    ${status}=  get from list  ${status_list}  0
    should be equal  ${status}  false
    Log To console  ${response.content}