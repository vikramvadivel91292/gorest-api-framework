*** Settings ***
Library    RequestsLibrary
Resource   ../../../resources/variable.robot
Resource   ../../../resources/keyword.robot

Suite Setup    Load Access Token And Account Data

*** Test Cases ***
Create New Account
    [Tags]    smoke    regression
    ${user_id}    ${resp}=    Create Account With Valid Data
    Log To Console    Created Account with ID: ${user_id}
    Log To Console    ${resp.text}
