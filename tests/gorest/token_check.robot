*** Settings ***
Resource    ../../resources/auth.robot

*** Test Cases ***
Token Check
    ${hdr}=    Get Auth Headers
    Log To Console    ${hdr}