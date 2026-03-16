*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Variables    ../../locators/UserManagementLocators/create_user_locators.py
Resource    ../common_keywords.resource
Resource    ../../pages/UserManagementPage/create_page.resource


*** Keywords ***

Create user with valid data
     [Arguments]     ${emp_name}        ${emp_pwd}     ${emp_confirm_pwd}       ${existing_emp}
     Create user     ${emp_name}    ${emp_pwd}      ${emp_confirm_pwd}      ${existing_emp}
     ${status}=    Is Success Message Displayed
     Should Be True   ${status}


Navigate to add user page
    Click on admin
    Click on add user button


Select existing employee from dropdown
    [Arguments]      ${existing_emp}
    Enter Employee Name     ${existing_emp}
    Select Emp Name


Create user
    [Arguments]     ${emp_name}=${EMPTY}     ${emp_pwd}=${EMPTY}     ${emp_confirm_pwd}=${EMPTY}       ${existing_emp}=${EMPTY}
    Navigate to add user page
    Select user role admin
    Selecr user status enable
    IF  $emp_name
        create_user_page.Enter Username      ${emp_name}
    END
    IF  $emp_pwd
        create_user_page.Enter Password      ${emp_pwd}
    END

    IF  $emp_confirm_pwd
        Enter Confirm Password      ${emp_confirm_pwd}
    END
    IF    $existing_emp
        Select existing employee from dropdown     ${existing_emp}
    END
    Click Save Button

