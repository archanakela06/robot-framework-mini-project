*** Settings ***

Library     SeleniumLibrary
Variables   ../../locators/UserManagementLocators/create_user_locators.py
Resource    ../../keywords/common_keywords.resource


*** Variables ***

${role}     Admin


*** Keywords ***

Click on admin
    Click Element    ${ADMIN_MENU}
    ${status}=     Verify Element Visibility    ${TITLE_ADMIN_USER_PAGE}
    IF  not ${status}
         Log    Admin title not visiable ${TITLE_ADMIN_USER_PAGE}
    END
    #Wait Until Element Is Visible    ${TITLE_ADMIN_USER_PAGE}   4s

Click on add user button
    ${status}=  Verify Element Enable   ${BTN_ADD_USER}
    IF    ${status}
         Click Button    ${BTN_ADD_USER}
    END
#    Wait Until Element Is Enabled    ${BTN_ADD_USER}    4s
    #Click Button    ${BTN_ADD_USER}

Select user role admin
    ${status}=   Verify Element Visibility       ${DROP_DOWN_USER_ROLE}
    IF    ${status}
         Click Element   ${DROP_DOWN_USER_ROLE}
         Sleep    5s
         Click Element    ${SELECT_ADMIN_ROLE}
    END
#
#    Wait Until Element Is Visible    ${DROP_DOWN_USER_ROLE}
#    Click Element   ${DROP_DOWN_USER_ROLE}
#    Sleep    5s
#    Click Element    ${SELECT_ADMIN_ROLE}

Selecr user status enable
    ${status}=   Verify Element Visibility      ${DROP_DOWN_STATUS}
    IF    ${status}
         Click Element    ${DROP_DOWN_STATUS}
         Sleep    3s
        Click Element       ${STATUS_ENABLE_OPTION}
    END
#    Click Element    ${DROP_DOWN_STATUS}
#    Sleep    3s
#    Click Element       ${STATUS_ENABLE_OPTION}

Enter Username
    [Arguments]     ${empname}
    Clear Element Text    ${TXT_USERNAME}
    Input Text    ${TXT_USERNAME}    ${empname}

Enter Password
    [Arguments]     ${emppassword}
    Clear Element Text    ${TXT_PASSWORD}
    Input Text    ${TXT_PASSWORD}    ${emppassword}

Enter Confirm Password
    [Arguments]     ${confirmpwd}
    Clear Element Text    ${INPUT_CONFIRM_PASSWORD}
    Input Text    ${INPUT_CONFIRM_PASSWORD}    ${confirmpwd}


Enter Employee Name
    [Arguments]     ${emp_name}
    Clear Element Text    ${INPUT_EMPLOYEE_NAME}
    Input Text    ${INPUT_EMPLOYEE_NAME}    ${emp_name}
    #Select Emp Name     ${emp_name}


Select Emp Name
    #[Arguments]    ${emp_name}
    Wait until locator visiable     ${DD_SELECT_EMP}
    #Wait Until Element Is Visible    xpath://div[@role="listbox"]/div/span  10s
    #Click Element    xpath://div[@role="listbox"]/div[1]
    Click On Element    ${SELECT_EMP_FROM_LIST}

Click Save Button
    Click On Element     ${BTN_SAVE}
    #Click Button    ${BTN_SAVE}

Is Success Message Displayed
    ${status}=     Verify Element Visibility   ${SUCCESS_MSG}
    RETURN  ${status}

#Validate Success Message
#    Wait Until Element Is Visible    ${SUCCESS_MSG}
#    Element Should Be Visible    ${SUCCESS_MSG}
