*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../Resources/UserKeyword.robot

*** Variables ***
${URl}  http://thetestingworldapi.com/
${id}  567767

*** Test Cases ***
TC1_FectData
    Fetch_The_Details  50  200
    ${response}=  Fetch_Return_Data  50
    Log To Console  ${response.content}

