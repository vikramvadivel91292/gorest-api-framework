*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Get User With Invalid ID
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    gorest    /users/99999999    expected_status=404
    Should Be Equal As Integers    ${response.status_code}    404
