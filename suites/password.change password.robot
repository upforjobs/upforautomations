*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Resource          _keywords.txt
Resource          _mysetup.txt
Library           SeleniumLibrary
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login with old password

Password short
    #error
    Input Text    xpath=//input[@id='currentPassword']    invalid
    Input Text    xpath=//input[@id='password']    s
    Input Text    xpath=//input[@id='confirmedPassword']    invalid
    Click Element    xpath=//button[contains(text(),'Update')]
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Too Short!')]
    Element Should Be Visible    xpath=//p[contains(text(),'Too Short!')]
    Element Text Should Be    xpath=//p[contains(text(),'Too Short!')]    Too Short!
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Passwords must match')]
    Element Should Be Visible    xpath=//p[contains(text(),'Passwords must match')]
    Element Text Should Be    xpath=//p[contains(text(),'Passwords must match')]    Passwords must match
    Capture Page Screenshot    password-error-message-{index}.png

New Password
    Clear Element Text    xpath=//input[@id='currentPassword']
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='confirmedPassword']
    Capture Page Screenshot    clear-input-fields{index}.png
    Input Text    xpath=//input[@id='currentPassword']    invalid
    Input Text    xpath=//input[@id='password']    invalidrandom
    Input Text    xpath=//input[@id='confirmedPassword']    random
    Click Element    xpath=//button[contains(text(),'Update')]
    Capture Page Screenshot    clear-input-fields{index}.png
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Password must contain min 8 characters: at least o')]
    Element Should Be Visible    xpath=//p[contains(text(),'Password must contain min 8 characters: at least o')]
    Element Text Should Be    xpath=//p[contains(text(),'Password must contain min 8 characters: at least o')]    Password must contain min 8 characters: at least one lowercase letter, one uppercase letter, one numeric digit, and one special character
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Passwords must match')]
    Element Should Be Visible    xpath=//p[contains(text(),'Passwords must match')]
    Element Text Should Be    xpath=//p[contains(text(),'Passwords must match')]    Passwords must match

Current Password
    Clear Element Text    xpath=//input[@id='currentPassword']
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='confirmedPassword']
    Capture Page Screenshot    clear-input-fields{index}.png
    Input Text    xpath=//input[@id='currentPassword']    invalid
    Input Text    xpath=//input[@id='password']    Password##88
    Input Text    xpath=//input[@id='confirmedPassword']    Password##88
    Click Element    xpath=//button[contains(text(),'Update')]
    Capture Page Screenshot    clear-input-fields{index}.png
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Password is incorrect')]
    Element Should Be Visible    xpath=//p[contains(text(),'Password is incorrect')]
    Element Text Should Be    xpath=//p[contains(text(),'Password is incorrect')]    Password is incorrect
    #old password is not correct
