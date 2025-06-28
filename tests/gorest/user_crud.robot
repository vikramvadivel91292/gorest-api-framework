*** Settings ***
Resource    ../../resources/rest_client.robot
Resource    ../../resources/auth.robot
Variables   ../../data/users.yaml
Library     JSONLibrary

*** Test Cases ***
Users → Full CRUD Flow
    ${hdr}=    Get Auth Headers
    Create API Session    api    ${hdr}

    ${user}=    Get From Dictionary    ${USERS}    valid
    ${resp_body}    ${headers}=    Send Request    api    POST    /users    ${user}    201
    ${user_id}=    Get From Dictionary    ${resp_body}    id

    ${get_body}=    Send Request    api    GET    /users/${user_id}    None    200
    Should Be Equal    ${get_body[name]}    ${user[name]}

    ${user}[name]=Converted Name
    ${upd_body}    ${_}=    Send Request    api    PUT    /users/${user_id}    ${user}    200
    Should Be Equal    ${upd_body[name]}    Converted Name

    Send Request    api    DELETE    /users/${user_id}    None    204