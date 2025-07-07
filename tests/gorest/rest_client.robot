*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://gorest.co.in/public/v2

*** Keywords ***
Create API Session
    [Arguments]    ${alias}    ${headers}
    Create Session    ${alias}    ${BASE_URL}    headers=${headers}

Send Request
    [Arguments]    ${alias}    ${method}    ${endpoint}    ${payload}=None    ${expected_status}=200
    Run Keyword If    '${method}' == 'GET'     ${resp}=    GET Request     ${alias}    ${endpoint}
    ...    ELSE IF    '${method}' == 'POST'    ${resp}=    POST Request    ${alias}    ${endpoint}    json=${payload}
    ...    ELSE IF    '${method}' == 'PUT'     ${resp}=    PUT Request     ${alias}    ${endpoint}    json=${payload}
    ...    ELSE IF    '${method}' == 'DELETE'  ${resp}=    DELETE Request  ${alias}    ${endpoint}
    ...    ELSE    Fail    Unsupported HTTP method: ${method}

    Should Be Equal As Integers    ${resp.status_code}    ${expected_status}
    ${body}=       To JSON                 ${resp.content}
    ${headers}=    Get From Dictionary     ${resp}    headers
    RETURN       ${body}    ${headers}