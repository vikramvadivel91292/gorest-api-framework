*** Settings ***
Resource    ../../../resources/keywords.robot      
Resource    ../../../resources/variables.robot

*** Test Cases ***
Create User With Extra Fields
    [Tags]    regression
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${random}=    Generate Random String    5
    ${data}=    Create Dictionary    name=Extra Field    gender=male    email=extrafield${random}@domain.com    status=active    extra=shouldfail
    ${response}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response.status_code}    201
    Log To Console   ${response.content}
    Dictionary Should Not Contain Key    ${response.json()}    extra
