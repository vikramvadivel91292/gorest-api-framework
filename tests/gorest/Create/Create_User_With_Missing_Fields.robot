*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Create User With Missing Fields
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${data}=    Create Dictionary    gender=male    status=active
    ${response}=    POST On Session    gorest    /users    json=${data}    expected_status=422
    Should Be Equal As Integers    ${response.status_code}    422
