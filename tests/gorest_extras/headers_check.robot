*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Test Cases ***

Unpack Check
    ${resp}=    Evaluate    {"headers": {"X-Test": "123"}}
    ${headers}=    Get From Dictionary    ${resp}    headers
    Log To Console    ${headers}