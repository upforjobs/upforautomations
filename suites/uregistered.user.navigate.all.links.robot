*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Test Setup
Library           SeleniumLibrary
Resource          _mysetup.txt
Resource          _keywords.txt
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Navigate all link
    Maximize Browser Window
    GoTo    ${TESTURL}
    Navheader Unregistered
    #hero-container
    Wait Until Element Is Visible    id=hire
    Element Should Be Visible    xpath=//button[@id='hire']
    Element Should Be Enabled    css=#hire
    Wait Until Element Is Visible    id=getHired
    Element Should Be Visible    xpath=//button[@id='getHired']
    Element Should Be Enabled    css=#getHired

*** Keywords ***
