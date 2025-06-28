*** Settings ***
Resource          ../../resources/keywords.robot

*** Test Cases ***
Get Users With Pagination
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users?page=2
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    Should Not Be Empty    ${json}
