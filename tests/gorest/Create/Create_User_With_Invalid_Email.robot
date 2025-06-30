*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Create User With Invalid Email
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${data}=    Create Dictionary    name=Test User    gender=male    email=invalidemail    status=active
    ${response}=    POST On Session    gorest    /users    json=${data}    expected_status=422
    Should Be Equal As Integers    ${response.status_code}    422
