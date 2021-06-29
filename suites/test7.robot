*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Test Setup
Test Teardown
Library           SeleniumLibrary
Library           XvfbRobot
Library           String
Resource          _mysetup.txt
Resource          _keywords.txt

*** Variables ***
${TMP_PATH}       /tmp
@{DOCTOR}         Shubham##99    Shubham##88

*** Test Cases ***
doctor login - failure
    [Setup]
    Go To    ${TESTURL}
    Clear Element Text    name:email
    Input Text    name:email    ${DOCEMAIL}
    Capture Page Screenshot    doctor-email-{index}.png
    Clear Element Text    name:password
    Input Password    name:password    invalid
    Capture Page Screenshot    doctor-invalid-password-{index}.png
    Click Element    xpath://label[@for='checkbox1']
    Submit Form
    Wait Until Element Is Visible    xpath://li[contains(text(),'These credentials do not match our records.')]
    Element Text Should Be    xpath://li[contains(text(),'These credentials do not match our records.')]    These credentials do not match our records.
    ${alert} =    Get Text    xpath://li[contains(text(),'These credentials do not match our records.')]
    Log To Console    ${alert}
    Capture Page Screenshot    doctor-login-failure-{index}.png

doctor login - success
    [Setup]
    Go To    ${TESTURL}
    Clear Element Text    name:email
    Input Text    name:email    ${DOCEMAIL}
    Capture Page Screenshot    doctor-email-{index}.png
    Clear Element Text    name:password
    Input Password    name:password    @{DOCTOR}[0]
    Capture Page Screenshot    doctor-old-password-{index}.png
    Click Element    xpath://label[@for='checkbox1']
    Submit Form
    Log    Patient has successfully login
    LogoutKW
    Capture Page Screenshot    doctor-login-success-{index}.png

doctor change password - fail
    [Documentation]    assert and verify all messages when fail
    LoginDocKW
    Click Element    id:m_aside_left_offcanvas_toggle
    Click Element    xpath://span[contains(text(),'Profile')]
    Click Element    xpath://a[contains(text(),'Change password')]
    Capture Page Screenshot    doctor-goto-change-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'Current password')]    Current password
    Input Text    id:current    @{DOCTOR}[0]
    Capture Page Screenshot    doctor-current-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'New password')]    New password
    Element Text Should Be    xpath://label[contains(text(),'Confirm password')]    Confirm password
    Click Element    id:savePasswordBtn
    ${alert} =    Get Text    xpath://li[contains(text(),'Password field is required.')]
    Log To Console    ${alert}
    Should Contain    xpath://li[contains(text(),'Password field is required.')]    Password field is required.
    Capture Page Screenshot    doctor-password-field-id-required-{index}.png
    Click Element    xpath://a[contains(text(),'Change password')]
    Input Text    id:current    @{DOCTOR}[0]
    Element Text Should Be    xpath://label[contains(text(),'New password')]    New password
    Input Text    id:new1    short
    Capture Page Screenshot    doctor-new-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'Confirm password')]    Confirm password
    Input Text    id:new2    invalid
    Capture Page Screenshot    doctor-confirm-new-password-{index}.png
    Click Element    id:savePasswordBtn
    ${least} =    Get Text    xpath://li[contains(text(),'The password must be at least 8 characters')]
    Log To Console    ${least}
    Should Contain    xpath://li[contains(text(),'The password must be at least 8 characters.')]    The password must be at least 8 characters.
    ${not_match} =    Get Text    xpath://li[contains(text(),'The password confirmation does not match')]
    Log To Console    ${not_match}
    Should Contain    xpath://li[contains(text(),'The password confirmation does not match.')]    The password confirmation does not match.
    ${invalid} =    Get Text    xpath://li[contains(text(),'The password format is invalid.')]
    Log To Console    ${invalid}
    Should Contain    xpath://li[contains(text(),'The password format is invalid.')]    The password format is invalid.
    Capture Page Screenshot    change-password-failure-{index}.png
    Click Element    xpath://a[@id='chan_pass']
    Input Text    id:new1    ${ADMINPW}
    Input Text    id:new2    ${ADMINPW}
    Click Element    id:savePasswordBtn
    Capture Page Screenshot    current-password-field-is-required-{index}.png
    ${required_password} =    Get Text    xpath://li[contains(text(),'The current password field is required.')]
    Log To Console    ${required_password}
    LogoutKW

doctor change password - success
    [Setup]
    LoginDocKW
    Click Element    id:m_aside_left_offcanvas_toggle
    Click Element    xpath://span[contains(text(),'Profile')]
    Click Element    xpath://a[contains(text(),'Change password')]
    Capture Page Screenshot    doctor-goto-change-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'Current password')]    Current password
    Input Text    id:current    @{DOCTOR}[0]
    Capture Page Screenshot    doctor-current-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'New password')]    New password
    Input Text    id:new1    @{DOCTOR}[1]
    Capture Page Screenshot    doctor-new-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'Confirm password')]    Confirm password
    Input Text    id:new2    @{DOCTOR}[1]
    Capture Page Screenshot    doctor-confirm-new-password-{index}.png
    Click Element    id:savePasswordBtn
    Capture Page Screenshot    doctor-changed-password-success{index}.png
    Should Contain    Password changed successfully.    Password changed successfully.
    LogoutKW

doctor login with old password - failure
    [Setup]
    Go To    ${TESTURL}
    Clear Element Text    name:email
    Input Text    name:email    ${DOCEMAIL}
    Capture Page Screenshot    doctor-email-{index}.png
    Clear Element Text    name:password
    Input Password    name:password    @{DOCTOR}[0]
    Capture Page Screenshot    doctor-old-password-{index}.png
    Click Element    xpath://label[@for='checkbox1']
    Submit Form
    Element Text Should Be    xpath://li[contains(text(),'These credentials do not match our records.')]    These credentials do not match our records.
    Capture Page Screenshot    doctor-old-pass-failure-{index}.png

doctor login with changed password - success
    [Setup]
    Go To    ${TESTURL}
    Clear Element Text    name:email
    Input Text    name:email    ${DOCEMAIL}
    Capture Page Screenshot    doctor-email-{index}.png
    Clear Element Text    name:password
    Input Password    name:password    @{DOCTOR}[1]
    Capture Page Screenshot    doctor-new-password-{index}.png
    Click Element    xpath://label[@for='checkbox1']
    Submit Form
    Capture Page Screenshot    doctor-login-with-new-password-{index}.png
    Log    Patient has successfully login
    LogoutKW
    [Teardown]    Setup Doctor Password

*** Keywords ***
Open Testbrowser
    ${system}=    Evaluate    platform.system()    platform
    Run Keyword If    '${system}' == 'Linux'    Start Virtual Display    1920    1080
    Open Chrome Browser

Open Chrome Browser
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
