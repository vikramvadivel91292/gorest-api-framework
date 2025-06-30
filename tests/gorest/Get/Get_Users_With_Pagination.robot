*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Get Users With Pagination
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    &{params}=    Create Dictionary    page=2
    ${response}=    GET On Session    gorest    /users    params=${params}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert String To Json    ${response.content}
    Should Not Be Empty    ${json}
