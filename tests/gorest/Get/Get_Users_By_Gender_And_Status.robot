*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Get Users By Gender And Status
    [Tags]    smoke    regression
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    &{params}=    Create Dictionary    gender=male    status=active
    ${response}=    GET On Session    gorest    /users    params=${params}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert String To Json    ${response.content}
    FOR    ${user}    IN    @{json}
        Should Be Equal    ${user['gender']}    male
        Should Be Equal    ${user['status']}    active
    END
