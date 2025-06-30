*** Settings ***
Resource    ../../resources/rest_client.robot
Resource    ../../resources/auth.robot
Variables   ../../data/users.yaml

*** Test Cases ***
Create User Using Invalid Payload
    ${hdr}=    Get Auth Headers
    Create API Session    api    ${hdr}
    ${inv}=    Get From Dictionary    ${USERS}    invalid
    ${resp}=    Post On Session    api    /users    json=${inv}
    Should Be True    ${resp.status_code} == 422

Delete Non‑existent User
    ${hdr}=    Get Auth Headers
    Create API Session    api    ${hdr}
    ${_}    ${headers}=    Send Request    api    DELETE    /users/0    None    404