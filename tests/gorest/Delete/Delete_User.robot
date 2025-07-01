*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Delete User
    [Tags]    smoke    regression
    ${user_id}=    Create Valid User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    DELETE On Session    gorest    /users/${user_id}
    Should Be Equal As Integers    ${response.status_code}    204
    