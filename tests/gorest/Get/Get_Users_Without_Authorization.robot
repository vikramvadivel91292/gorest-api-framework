*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Get Users Without Authorization
    [Tags]    regression
    Create Session    gorest    ${BASE_URL}
    ${response}=    GET On Session    gorest    /users
    Should Be Equal As Integers    ${response.status_code}    200
