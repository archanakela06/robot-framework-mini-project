*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/pages/LoginPage/login_page.resource
#Variables    ../../TestData/LoginTestData/login_testdata.py
Resource    ../../resources/keywords/LoginKeywords/login_keywords.resource
Resource    ../../resources/keywords/framework_keywords.resource
Library    ../../core/data_manager.py


Suite Setup     Initialize Framework
Test Teardown    Run Keyword If Test Failed    Capture Failure Screenshot
Suite Teardown    Close My Browser



*** Test Cases ***

Valid Login Should Display Dashboard
    ${data}=    Get Test Data   login_test   valid_login
    Perform Login   ${data}[username]    ${data}[password]
    Dashboard Should Be Visible
    Perform Logout
    
Required Message Should Display For Empty Username
    ${data}=    Get Test Data   login_test   empty_username    
    Perform Login    ${data}[username]    ${data}[password]
    Required Username Message Should Be Visible

Required Message Should Display For Empty Password
    ${data}=    Get Test Data   login_test    empty_password
    Perform Login    ${data}[username]    ${data}[password]
    Required Password Message Should Be Visible

Invalid Login Should Display Error Message
    ${data}=    Get Test Data   login_test   invalid_login
    Perform Login    ${data}[username]    ${data}[password]
    Invalid Login Message Should Be Visible


    

#Login with invalid user
#     [Tags]     regression
#     Login With Invalid Creds   ${INVALID_USER}    ${INVALID_PASSWORD}
#
#Login without username and password
#     [Tags]     sanity
#     Login Without Username and Password
#
#Login with valid username and invalid password
#    [Tags]      regression
#    Login With Invalid Creds      ${VALID_USER}       ${INVALID_PASSWORD}
#
#Login with valid user
#    [Tags]      smoke       regression
#    Login With Valid Creds    ${VALID_USER}    ${VALID_PASSWORD}    logout=${True}
#Login should redirect to dashboard
#    Login Should Redirect To Dashboard URL      ${VALID_USER}    ${VALID_PASSWORD}    logout=${True}