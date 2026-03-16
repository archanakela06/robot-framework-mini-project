*** Settings ***
Library     SeleniumLibrary
Variables    ../../locators/LoginLocators/login_locators.py
Resource     ../../keywords/common_keywords.resource


*** Keywords ***
# ---------------------------------------------
# Login Page Actions
# ----------------------------------------------
Enter Username
    [Arguments]    ${username}
    Clear Element Text    ${INPUT_USERNAME}
    Input text    ${INPUT_USERNAME}     ${username}

Enter Password
    [Arguments]    ${password}
    Clear Element Text       ${INPUT_PASSWORD}
    Input text    ${INPUT_PASSWORD}     ${password}

Click On Login
    ${locator_visiable}=    Wait until locator visiable   ${LOGIN_BUTTON}
    IF   ${locator_visiable}
        Click Button    ${LOGIN_BUTTON}
    ELSE
        Log     login button not visiable
    END

# -------------------------------------------------
# Logout Actions
# -------------------------------------------------
Click On Logout
    Click Element    ${LOGOUT_DROPDOWN}
    Click Element    ${LOGOUT_BUTTON}


# -------------------------------------------------
# State Verification Helpers
# -------------------------------------------------


Is Dashboard Visible
    ${status}=    Verify Element Visibility    ${DASHBOARD}
    RETURN   ${status}

Is Invalid Login Visible
    ${error_msg}=   Verify Element Visibility    ${ERR_MESSAGE}
    RETURN    ${error_msg}

Is Username Required Message Visible
    ${required}=    Verify Element Visibility    ${USER_NAME_REQUIRED}
    RETURN  ${required}

Is Password Required Message Visible
    ${required}=    Verify Element Visibility    ${PWD_REQUIRED}
    RETURN  ${required}

Is Logout Button Visible
    ${status}=     Verify Element Visibility    ${LOGOUT_DROPDOWN}
    RETURN  ${status}





