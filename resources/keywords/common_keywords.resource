*** Settings ***
Library    SeleniumLibrary
Variables  ../../variables/config.yaml

*** Keywords ***
Open Application

    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Call Method    ${chrome_options}    add_argument    --headless=new
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --window-size=1920,1080

    Create Webdriver    Chrome    options=${chrome_options}

    Go To    ${base_url}

Close Application
    Close Browser