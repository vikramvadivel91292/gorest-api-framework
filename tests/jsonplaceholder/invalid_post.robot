*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get JSONPlaceholder Post - Invalid ID
    Create Session    json    ${BASE_URL}
    ${resp}=    Get Request    json    /posts/0
    Should Be Equal As Integers    ${resp.status_code}    404