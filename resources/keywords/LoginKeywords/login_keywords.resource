*** Settings ***
Library     SeleniumLibrary
Variables    ../../locators/LoginLocators/login_locators.py
#Variables    ../../../TestData/LoginTestData/login_testdata.py
Resource     ../common_keywords.resource
Resource     ../../pages/LoginPage/login_page.resource


*** Keywords ***

# -------------------------------------------------------------------
# Action Keywords No Assertions
# -------------------------------------------------------------------

Perform Login
   [Arguments]    ${username}=${EMPTY}    ${password}=${EMPTY}
    IF    $username
        login_page.Enter Username    ${username}
    END
    IF    $password
        login_page.Enter Password    ${password}
    END
    Click On Login
##    IF    ${logout}
##        Perform Logout
##    END

Perform Logout
   ${is_logout_visible}=   Run Keyword And Return Status
    ...                    Page Should Contain Element    ${LOGOUT_DROPDOWN}
   IF   ${is_logout_visible}
              Click On Logout
   END


# -------------------------------------------------------------------
# Validation Keywords  - Assertion Only
# -------------------------------------------------------------------

Dashboard Should Be Visible
    ${status}=   Is Dashboard Visible
    Should Be True    ${status}

Invalid Login Message Should Be Visible
    ${status}=   Is Invalid Login Visible
    Should Be True    ${status}

Required Username Message Should Be Visible
    ${status}=    Is Username Required Message Visible
    Should Be True    ${status}

Required Password Message Should Be Visible
    ${status}=    Is Password Required Message Visible
    Should Be True    ${status}

Should Be On Dashboard URL
    Location Should Be    ${DASHBOARD_URL}

Login And Verify Dashboard
    [Arguments]    ${username}    ${password}
    Perform Login   ${username}    ${password}
    Dashboard Should Be Visible


#Login With Invalid Creds
#    [Arguments]    ${username}    ${password}
#    Perform Login    ${username}    ${password}
#    ${err_msg}=    Is Invalid Login Visible
#    Should Be True    ${err_msg}
#
#
#Login Without Username and Password
#    Perform Login
#    ${required}=    Is Required Message Visible
#    Should Be True    ${required}
#
#
#Login With Valid Creds
#    [Arguments]    ${username}    ${password}
#    Perform Login    ${username}    ${password}
#    ${dashboard}=    Is Dashboard Visible
#    Should Be True    ${dashboard}
#
#
#Login Should Redirect To Dashboard URL
#    [Arguments]    ${username}    ${password}
#    Perform Login    ${username}    ${password}
#    Location Should Be    ${DASHBOARD_URL}
