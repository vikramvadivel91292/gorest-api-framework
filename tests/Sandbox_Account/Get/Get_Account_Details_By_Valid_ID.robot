*** Settings ***
Library    RequestsLibrary
Resource   ../../../resources/variable.robot
Resource   ../../../resources/keyword.robot

Suite Setup    Load Access Token And Account Data

*** Test Cases ***
Read Account And Validate Data
    [Tags]    smoke    regression
    ${account_id_raw}=    Create Account With Valid Data
    ${account_id}=    Get From List    ${account_id_raw}    0
    # ${account_id}=    Set Variable    001gL00000DPxdJQAT
    ${headers}=    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}
    ${resp}=    GET    ${INSTANCE_URL}/services/data/${API_VERSION}/sobjects/Account/${account_id}    headers=${headers}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${account}=    To Json    ${resp.content}
    Should Be Equal    ${account['Id']}    ${account_id}
    Log To Console   ${resp}
    Log To Console   ${resp.text}
