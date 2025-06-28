*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get JSONPlaceholder Post - Valid
    Create Session    json    ${BASE_URL}
    ${resp}=    Get Request    json    /posts/1
    Should Be Equal As Integers    ${resp.status_code}    200
    Dictionary Should Contain Key    ${resp.json()}    title