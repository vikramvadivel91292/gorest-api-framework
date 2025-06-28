*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://api.github.com

*** Test Cases ***
Get GitHub User Profile - Invalid User
    Create Session    github    ${BASE_URL}
    ${resp}=    Get Request    github    /users/nonexistentuser1234567890
    Should Be Equal As Integers    ${resp.status_code}    404