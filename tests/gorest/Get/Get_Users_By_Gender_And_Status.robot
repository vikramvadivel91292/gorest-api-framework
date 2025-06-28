*** Settings ***
Resource          ../../resources/keywords.robot

*** Test Cases ***
Get Users By Gender And Status
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users?gender=male&status=active
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    :FOR    ${user}    IN    @{json}
    \    Should Be Equal    ${user['gender']}    male
    \    Should Be Equal    ${user['status']}    active
