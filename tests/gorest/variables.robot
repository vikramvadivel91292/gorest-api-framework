*** Settings ***
Library    String
Library    OperatingSystem
Library    JSONLibrary

*** Variables ***
${TOKEN_FILE}    ${CURDIR}/../data/token.txt
${BASE_URL}    https://gorest.co.in/public/v2
${USER_DATA_PATH}    /Users/vivadivel/Desktop/gorest-api-framework/data/user_data.json

*** Keywords ***
Get Auth Headers
    ${token}=    Get File    ${TOKEN_FILE}
    Should Not Be Empty   ${token}    msg=Token file is empty
    ${token}=    Strip String    ${token}
    &{headers}=    Create Dictionary    Authorization=Bearer ${token}
    Log    Token: Bearer ${token}
    RETURN    &{headers}
