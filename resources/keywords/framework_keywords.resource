*** Settings ***
Resource    common_keywords.resource


*** Keywords ***

Load Environment Config

    ${URL}=       Evaluate    __import__('core.config_manager', fromlist=['ConfigManager']).ConfigManager("${ENV}").get("url")
    ${Browser}=   Evaluate    __import__('core.config_manager', fromlist=['ConfigManager']).ConfigManager("${ENV}").get("browser")

    Set Suite Variable    ${URL}
    Set Suite Variable    ${Browser}

    Log To Console    URL: ${URL}
    Log To Console    Browser: ${Browser}


Get Test Data
    [Arguments]    ${file_name}    ${scenario}

    ${data}=    Evaluate
    ...    __import__('core.data_manager', fromlist=['DataManager']).DataManager().get_test_data("${file_name}", "${scenario}")

    RETURN    ${data}


Initialize Framework
    Load Environment Config
    Open my browser