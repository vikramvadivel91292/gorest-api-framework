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
Get Account With Invalid Id
    [Tags]    regression
    ${headers}=    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}
    ${resp}=    GET On Session    mysession   ${INSTANCE_URL}/services/data/${API_VERSION}/sobjects/Account/${invalid_account_id}    headers=${headers}    expected_status=404
    Log To Console    ${resp}
    Log To Console   ${resp.text}
    Should Be Equal As Integers    ${resp.status_code}    404
    Should Contain    ${resp.text}    NOT_FOUND
