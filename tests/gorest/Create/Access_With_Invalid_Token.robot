*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot  

*** Test Cases ***
Access With Invalid Token
    [Tags]    regression
    ${headers}=    Create Dictionary    Authorization=Bearer invalidtoken
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users    expected_status=401
    Should Be Equal As Integers    ${response.status_code}    401
