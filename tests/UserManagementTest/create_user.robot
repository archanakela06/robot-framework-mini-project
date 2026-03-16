*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/UserManagementKeywords/create_user_keywords.resource
#Variables    ../../TestData/UserManagement/create_user_testdata.py
Resource    ../../resources/keywords/common_keywords.resource

Suite Setup    Add User Prerequistes
Suite Teardown    Close My Browser


*** Test Cases ***

Create user with valid data
    Create user with valid data     ${USER_NAME}    ${PWD}      ${CONFRIM_PWD}      ${EMP_NAME}