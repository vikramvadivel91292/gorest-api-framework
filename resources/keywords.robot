*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Resource    variables.robot

*** Keywords ***
Generate Random String
    [Arguments]    ${length}
    ${CHARS}=    Set Variable    abcdefghijklmnopqrstuvwxyz0123456789
    ${result}=    Evaluate    ''.join(random.choices('${CHARS}', k=${length}))    random
    RETURN    ${result}

Create Valid User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${random}=    Generate Random String    5
    ${data}=    Create Dictionary    name=Test User    gender=male    email=testuser${random}@domain.com    status=active
    ${response}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response.status_code}    201
    ${json}=    ${resp.json()}    ${response.content}
    RETURN    ${json['id']}
