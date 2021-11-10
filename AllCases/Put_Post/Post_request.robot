*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${url}  http://thetestingworldapi.com/

*** Test Cases ***
TC1_post
    create session  Add_data  ${url}
    &{body}=  create dictionary  first_name=Testing  middle_name=Data  last_name=World  date_of_birth=7/11/2021
    ${response}=  post on session  Add_data  api/studentsDetails  data=${body}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  201
    Log To Console  ${response.content}