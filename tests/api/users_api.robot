*** Settings ***
Resource    ../../resources/keywords/api_keywords.resource

*** Test Cases ***
Get Users API Test
    tag    smoke
    Create API Session
    ${response}=    Get Users API
    Should Be Equal As Numbers    ${response.status_code}    200