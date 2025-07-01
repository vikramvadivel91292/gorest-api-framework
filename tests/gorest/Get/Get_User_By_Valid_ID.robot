*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Get User By Valid ID
    [Tags]    smoke    regression
    ${user_id}=    Create Valid User
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users/${user_id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    Should Be Equal    ${json['id']}    ${user_id}
