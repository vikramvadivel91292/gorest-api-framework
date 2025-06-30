*** Settings ***
Resource          ../../resources/keywords.robot

*** Test Cases ***
Get User With Invalid ID
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users/99999999
    Should Be Equal As Integers    ${response.status_code}    404

Create User With Missing Fields
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${data}=    Create Dictionary    gender=male    status=active
    ${response}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response.status_code}    422

Create User With Invalid Email
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${data}=    Create Dictionary    name=Test User    gender=male    email=invalidemail    status=active
    ${response}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response.status_code}    422

Create Duplicate User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${random}=    Generate Random String    5
    ${data}=    Create Dictionary    name=Test User    gender=male    email=duptest${random}@domain.com    status=active
    ${response1}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response1.status_code}    201
    ${response2}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response2.status_code}    422

Update User With Invalid Data
    ${user_id}=    Create Valid User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${data}=    Create Dictionary    gender=invalidgender
    ${response}=    PATCH On Session    gorest    /users/${user_id}    json=${data}
    Should Be Equal As Integers    ${response.status_code}    422

Delete User With Invalid ID
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    DELETE On Session    gorest    /users/99999999
    Should Be Equal As Integers    ${response.status_code}    404

Get Users Without Authorization
    Create Session    gorest    ${BASE_URL}
    ${response}=    GET On Session    gorest    /users
    Should Be Equal As Integers    ${response.status_code}    401

Access With Invalid Token
    ${headers}=    Create Dictionary    Authorization=Bearer invalidtoken
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users
    Should Be Equal As Integers    ${response.status_code}    401

Unsupported HTTP Method
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    PATCH On Session    gorest    /users
    Should Be Equal As Integers    ${response.status_code}    405

Create User With Extra Fields
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${random}=    Generate Random String    5
    ${data}=    Create Dictionary    name=Extra Field    gender=male    email=extrafield${random}@domain.com    status=active    extra=shouldfail
    ${response}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response.status_code}    422

Get Users With Invalid Query Parameter
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users?gender=unknown
    Should Be Equal As Integers    ${response.status_code}    422
