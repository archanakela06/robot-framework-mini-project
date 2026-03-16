*** Settings ***
Library     SeleniumLibrary
#Variables    ../../TestData/common_testdata.py
#Resource    ../../TestData/LoginTestData/login_testdata.py
Resource    ../keywords/framework_keywords.resource


*** Variables ***
${SCREENSHOT_DIR}    results/screenshots

*** Keywords ***
Open my browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --ignore-ssl-errors
    Call Method    ${options}    add_argument    --allow-running-insecure-content
    Call Method    ${options}    set_capability    acceptInsecureCerts    ${True}

    Open Browser    ${URL}    ${Browser}    options=${options}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    #Sleep    5s

    #Run Keyword And Ignore Error    Press Keys    None    thisisunsafe

Close my browser
    Close all browsers

#Login Prerequistes
#    Open my browser
#    Perform Login     ${VALID_USER}   ${VALID_PASSWORD}


Add User Prerequistes
      Open my browser
      Perform Login     ${LOGIN_USER}   ${LOGIN_PASSWORD}    logout=${False}


Wait until locator visiable
    [Arguments]     ${locator}      ${timeout}=5s
    ${status}=      Run Keyword And Return Status   Wait Until Element Is Visible    ${locator}    ${timeout}
    IF  not ${status}
         Log    Locator not visible: ${locator}    WARN
    END
    RETURN    ${status}


Verify Element Visibility
    [Arguments]    ${locator}
    ${status}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${locator}    10s
    RETURN    ${status}



Verify Element Enable
    [Arguments]     ${locator}      ${timeout}=5s
    ${status}=    Run Keyword And Return Status     Wait Until Element Is Enabled    ${locator}     ${timeout}
    RETURN  ${status}


Click On Element
    [Arguments]     ${locator}
    Click Element    ${locator}


Click On Button
    [Arguments]     ${locator}
    Click Button    ${locator}



Capture Failure Screenshot
    ${timestamp}=    Get Time    epoch
    Capture Page Screenshot    ${OUTPUT DIR}/screenshots/FAIL_${timestamp}.png