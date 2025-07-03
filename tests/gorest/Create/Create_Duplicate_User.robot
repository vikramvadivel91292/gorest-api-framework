*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Create Duplicate User
    [Tags]    regression
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${random}=    Generate Random String    5
    ${data}=    Create Dictionary    name=Test User    gender=male    email=duptest${random}@domain.com    status=active
    ${response1}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response1.status_code}    201
    Log To Console   ${response1.content}
    ${response2}=    POST On Session    gorest    /users    json=${data}    expected_status=422
    Should Be Equal As Integers    ${response2.status_code}    422
    Log To Console   ${response2.content}
