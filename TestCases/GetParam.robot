*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variable ***
${url}  https://reqres.in

*** Test Cases ***
TC1_Get_Param
    create session  Get_Param  ${url}
    &{param}=  create dictionary  page=2
    ${response}=  get request  Get_param  /api/users  params=${param}
    Log To Console  ${response.status_code}
    Log To Console  ${response.content}
