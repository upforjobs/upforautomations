*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          _keywords.txt
Resource          _mysetup.txt
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login to the website
    Maximize Browser Window
    Go To    ${TESTURL}
    Wait Until Element Is Visible    class=Login_headingText__2QdrP
    Input Text    id=emailOrUserName    ufj
    Input Text    id=password    ${ufjpass}
    Submit Form

How it Works page
    Wait Until Element Is Visible    xpath=//a[@id='howItWorks']
    Click Element    id=howItWorks
    Capture Page Screenshot    howItWorks- {index}.png

Find a Job
    Click Element    id=findAJobLink
    Navheader Unregistered
    Capture Page Screenshot    postAJobNavButton-{index}.png
