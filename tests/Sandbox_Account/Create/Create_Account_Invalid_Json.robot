*** Settings ***
Library    RequestsLibrary
Resource   ../../../resources/variable.robot
Resource   ../../../resources/keyword.robot

Suite Setup    Load Access Token And Account Data

*** Test Cases ***
Create Account With Invalid JSON
    [Tags]    regression
    ${headers}=    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}    Content-Type=application/json
    ${resp}=    POST    ${INSTANCE_URL}/services/data/${API_VERSION}/sobjects/Account/    headers=${headers}    json=${MALFORMED_JSON}
    Should Be Equal As Integers    ${resp.status_code}    400
    ${account_id}=    Set Variable    ${resp.json()['id']}
    Set Suite Variable    ${account_id}
    Log To Console   ${resp}
    Log To Console   ${resp.text}
