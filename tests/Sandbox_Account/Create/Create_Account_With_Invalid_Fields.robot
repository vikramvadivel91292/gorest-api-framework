*** Settings ***
Library    RequestsLibrary
Resource   ../../../resources/variable.robot
Resource   ../../../resources/keyword.robot

Suite Setup    Setup Session And Load Data

*** Keywords ***
Setup Session And Load Data
    Create Session    mysession    ${INSTANCE_URL}
    Load Access Token And Account Data

*** Test Cases ***
Create Account With Invalid Fields
    [Tags]    regression
    ${headers}=    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}    Content-Type=application/json
    ${resp}=    POST On Session    mysession    ${INSTANCE_URL}/services/data/${API_VERSION}/sobjects/Account/    headers=${headers}    json=${INVALID_DATA}    expected_status=400
    Should Be Equal As Integers    ${resp.status_code}    400
    Should Contain    ${resp.text}    INVALID_FIELD
    Log To Console   ${resp}
    Log To Console   ${resp.text}
