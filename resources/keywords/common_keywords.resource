*** Settings ***
Library    SeleniumLibrary
Variables  ../../variables/config.yaml

*** Keywords ***
Open Application
    Open Browser    ${base_url}    ${browser}
    Maximize Browser Window

Close Application
    Close Browser