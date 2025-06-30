*** Settings ***
Resource          ../../resources/keywords.robot

*** Test Cases ***
Get All Users
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    Should Not Be Empty    ${json}

Get Users With Pagination
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users?page=2
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    Should Not Be Empty    ${json}

Create New User
    ${user_id}=    Create Valid User
    Log    Created user with ID: ${user_id}

Get User By Valid ID
    ${user_id}=    Create Valid User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users/${user_id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    Should Be Equal    ${json['id']}    ${user_id}

Update User With Valid Data
    ${user_id}=    Create Valid User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${data}=    Create Dictionary    name=Updated Name
    ${response}=    PATCH On Session    gorest    /users/${user_id}    json=${data}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    Should Be Equal    ${json['name']}    Updated Name

Delete User
    ${user_id}=    Create Valid User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    DELETE On Session    gorest    /users/${user_id}
    Should Be Equal As Integers    ${response.status_code}    204

Filter Users By Gender And Status
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users?gender=male&status=active
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    :FOR    ${user}    IN    @{json}
    \    Should Be Equal    ${user['gender']}    male
    \    Should Be Equal    ${user['status']}    active

Get Users With Large Page Size
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users?per_page=100
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    Should Not Be Empty    ${json}

Create User With Different Genders And Statuses
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${random}=    Generate Random String    5
    ${data}=    Create Dictionary    name=Test Female    gender=female    email=testfemale${random}@domain.com    status=inactive
    ${response}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response.status_code}    201
