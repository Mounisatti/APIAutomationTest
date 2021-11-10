*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variable ***
${url}  https://reqres.in

*** Test Cases ***
Test1
    [Tags]  Smoke
    create session  Get_Param  ${url}
    &{param}=  create dictionary  page=2
    ${response}=  get on session  Get_param  /api/users  params=${param}
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200
    ${jsonresponse}=  to json  ${response.content}
    @{name_list}=  get value from json  ${jsonresponse}  data[0].first_name
    ${name}=  get from list  ${name_list}  0
    should be equal  ${name}  Michael

