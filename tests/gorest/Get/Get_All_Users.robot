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
