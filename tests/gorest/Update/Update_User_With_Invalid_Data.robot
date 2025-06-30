*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Update User With Invalid Data
    ${user_id}=    Create Valid User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${data}=    Create Dictionary    gender=invalidgender
    ${response}=    PATCH On Session    gorest    /users/${user_id}    json=${data}    expected_status=422
    Should Be Equal As Integers    ${response.status_code}    422
