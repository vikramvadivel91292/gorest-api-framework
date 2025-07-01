*** Settings ***
Resource    ../../../resources/keywords.robot

*** Test Cases ***
[Tags]    smoke    regression
Create New User
    ${user_id}=    Create Valid User
    Log To Console    Created user with ID: ${user_id}
