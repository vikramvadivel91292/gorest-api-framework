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
Delete Account And Validate
    [Tags]    smoke    regression
    ${account_id} =    Create Account With Valid Data
    Log To Console   ${account_id}
    ${headers}=    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}
    ${resp}=    DELETE On Session    mysession    ${INSTANCE_URL}/services/data/${API_VERSION}/sobjects/Account/${account_id}    headers=${headers}    expected_status=204
    Log To Console   ${resp}
    Log To Console   ${resp.text}
    Should Be Equal As Integers    ${resp.status_code}    204
    ${resp}=    GET On Session    mysession    ${INSTANCE_URL}/services/data/${API_VERSION}/sobjects/Account/${account_id}    headers=${headers}    expected_status=404
    Log To Console   ${resp}
    Log To Console   ${resp.text}
    Should Be Equal As Integers    ${resp.status_code}    404
    Should Contain    ${resp.text}    NOT_FOUND
