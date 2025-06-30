*** Settings ***
Resource    ../../../resources/keywords.robot

*** Test Cases ***
Create New User
    ${user_id}=    Create Valid User
    Log To Console    Created user with ID: ${user_id}
