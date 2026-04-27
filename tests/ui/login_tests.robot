*** Settings ***
Resource    ../../resources/keywords/common_keywords.resource
Resource    ../../resources/locators/login_locators.resource

*** Test Cases ***
Valid Login Test
    [Tags]    smoke
    Open Application
    Input Text    ${USERNAME_FIELD}    standard_user
    Input Text    ${PASSWORD_FIELD}    secret_sauce
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain    Products
    Close Application