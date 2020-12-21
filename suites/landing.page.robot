*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           String
Library           XvfbRobot
Resource          _mysetup.txt
Resource          _keywords.txt

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login user
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Login modal dialog
    Click Element    class:closeModal

Register modal
    Maximize Browser Window
    Go To    ${TESTURL}
    Wait Until Element Is Visible    xpath://button[contains(text(),'Login')]
    Click Element    xpath://button[contains(text(),'Login')]
    Wait Until Element Is Visible    class:btnLogin
    Click Element    class:btnLogin
    Register modal dialog

Forgot password
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Wait Until Element Is Visible    class:btnLogin
    Click Element    xpath://button[contains(text(),'Forgot Password?')]
    #forgot password modal dialog
    Forgot Password modal dialog

*** Keywords ***
