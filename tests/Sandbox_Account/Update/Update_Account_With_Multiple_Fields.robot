*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Resource   ../../../resources/variable.robot
Resource   ../../../resources/keyword.robot

Suite Setup    Load Access Token And Account Data

*** Test Cases ***
Update Account With Multiple Fields
    [Tags]    smoke    regression
    ${account_id_raw}=    Create Account With Valid Data
    ${account_id}=    Get From List    ${account_id_raw}    0
    ${headers}=    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}    Content-Type=application/json
    ${json_string}=    Get File    data/update.json
    ${update_data}=    Evaluate    __import__('json').loads("""${json_string}""")
    ${resp}=    PATCH    ${INSTANCE_URL}/services/data/${API_VERSION}/sobjects/Account/${account_id}    headers=${headers}    json=${update_data}
    Should Be Equal As Integers    ${resp.status_code}    204
    ${headers}=    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}
    ${resp}=    GET    ${INSTANCE_URL}/services/data/${API_VERSION}/sobjects/Account/${account_id}    headers=${headers}
    Log To Console   ${resp.content}
    ${account}=    Convert String To Json    ${resp.text}
    FOR    ${key}    IN    @{update_data.keys()}
        Run Keyword If    '${key}' in ['AnnualRevenue', 'NumberOfEmployees']    Should Be Equal As Numbers    ${account['${key}']}    ${update_data['${key}']}
        ...    ELSE    Should Be Equal    ${account['${key}']}    ${update_data['${key}']}
    END
