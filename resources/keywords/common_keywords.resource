*** Settings ***
Library    SeleniumLibrary
Variables  ../../variables/config.yaml

*** Keywords ***
Open Application
    Open Browser    ${base_url}    ${browser}    options=add_argument("--headless"),add_argument("--no-sandbox"),add_argument("--disable-dev-shm-usage"),add_argument("--window-size=1920,1080")
    Set Window Size    1920    1080

Close Application
    Close Browser