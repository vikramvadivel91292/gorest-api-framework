*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Unsupported HTTP Method
    [Tags]    regression
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${user_id}=    Create Valid User
    ${get_response}=    GET On Session    gorest    /users/${user_id}
    Log To Console    GET status: ${get_response.status_code}
    Should Be Equal As Integers    ${get_response.status_code}    200
    ${post_response}=    POST On Session    gorest    /users/${user_id}    expected_status=404
    Log To Console    POST status: ${post_response.status_code}
    Should Be Equal As Integers    ${post_response.status_code}    404
