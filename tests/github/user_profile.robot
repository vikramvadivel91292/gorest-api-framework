*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://api.github.com

*** Test Cases ***
Get GitHub User Profile - Valid User
    Create Session    github    ${BASE_URL}
    ${resp}=    Get Request    github    /users/octocat
    Should Be Equal As Integers    ${resp.status_code}    200
    Dictionary Should Contain Key    ${resp.json()}    login
    Should Be Equal    ${resp.json()['login']}    octocat