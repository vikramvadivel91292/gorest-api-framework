*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
GET Users List from GoREST
    [Tags]    smoke    regression
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    ${count}=    Get Length    ${json}
    Log To Console    Found ${count} users
    Should Be True    ${count} > 0
