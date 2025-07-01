*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Post User Without Authorization
    [Tags]    regression
    Create Session    gorest    ${BASE_URL}
    ${random}=    Generate Random String    5
    ${data}=    Create Dictionary    name=No Auth    gender=male    email=noauth${random}@domain.com    status=active
    ${response}=    POST On Session    gorest    /users    json=${data}    expected_status=401
    Should Be Equal As Integers    ${response.status_code}    401
