*** Settings ***
Resource    ../../../resources/keywords.robot
Resource    ../../../resources/variables.robot

*** Test Cases ***
Create User With Different Genders And Statuses
    [Tags]    regression
    ${headers}=    Get Auth Headers
    Create Session    gorest    ${BASE_URL}    headers=${headers}
    ${random}=    Generate Random String    5
    ${data}=    Create Dictionary    name=Test Female    gender=female    email=testfemale${random}@domain.com    status=inactive
    ${response}=    POST On Session    gorest    /users    json=${data}
    Should Be Equal As Integers    ${response.status_code}    201
