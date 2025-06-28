*** Settings ***
Resource    ../../resources/rest_client.robot
Resource    ../../resources/auth.robot

*** Test Cases ***
Print Token
    ${hdr}=    Get Auth Headers
    Log To Console    ${hdr}

Rate‑Limit Headers on List
    ${hdr}=    Get Auth Headers
    Create API Session    api    ${hdr}
    ${body}    ${headers}=    Send Request    api    GET    /users?page=1&per_page=5    None    200
    Log To Console    ${headers}
    Should Contain    ${headers}    X-RateLimit-Limit
    Should Contain    ${headers}    X-Pagination-Total