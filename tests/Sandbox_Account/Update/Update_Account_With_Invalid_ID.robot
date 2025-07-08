*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Resource   ../../../resources/variable.robot
Resource   ../../../resources/keyword.robot

Suite Setup    Setup Session And Load Data

*** Keywords ***
Setup Session And Load Data
    Create Session    mysession    ${INSTANCE_URL}
    Load Access Token And Account Data

*** Test Cases ***
Update Account With Invalid Id
    [Tags]    regression
    ${headers}=    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}    Content-Type=application/json
    &{update_data}=    Create Dictionary    Phone=000-0000
    ${resp}=    PATCH On Session    mysession   ${INSTANCE_URL}/services/data/${API_VERSION}/sobjects/Account/${account_id}    headers=${headers}    json=${update_data}    expected_status=404
    Should Be Equal As Integers    ${resp.status_code}    404
    Should Contain    ${resp.text}    ENTITY_IS_DELETED
    Log To Console   ${resp}
    Log To Console   ${resp.text}
