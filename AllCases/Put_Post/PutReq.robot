*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${url}  http://thetestingworldapi.com/
${id}  527291

*** Test Cases ***
TC1_Put
    create session  Updated_data  ${url}
    &{body}=  create dictionary  id=527291  first_name=Testing  middle_name=apitesting123  last_name=World  date_of_birth=7/11/2021
    ${response}=  put on session  Updated_data  api/studentsDetails/${id}  data=${body}
    ${code}=  convert to string  ${response.status_code}
    #should be equal  ${code}  201
    #Log To Console  ${response.status_code}
    ${response1}=  get on session  Updated_data  api/studentsDetails/${id}
    Log To Console  ${response1.content}