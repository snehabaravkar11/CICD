*** Settings ***
Library    RequestsLibrary
Variables  ../../variables/config.yaml

*** Keywords ***
Create API Session
    Create Session    mysession    ${api_url}

Get Users API
    ${response}=    GET On Session    mysession    /api/users
    RETURN    ${response}