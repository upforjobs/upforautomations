*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Test Setup
Library           SeleniumLibrary
Library           XvfbRobot
Resource          _mysetup.txt
Resource          _keywords.txt
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***

*** Keywords ***
