*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Update User With Valid Data
    ${user_id}=    Create Valid User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${data}=    Create Dictionary    name=Updated Name
    ${response}=    PATCH On Session    gorest    /users/${user_id}    json=${data}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert String To Json    ${response.content}
    Should Be Equal    ${json['name']}    Updated Name
