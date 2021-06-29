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
@{PATIENT}        Shubham##99    Shubham##88

*** Test Cases ***
User login - failure
    Go To    ${TESTURL}
    Input Text    name:email    ${USEREMAIL}
    Capture Page Screenshot    patient-email-{index}.png
    Input Password    name:password    invalid
    Capture Page Screenshot    patient-invalid-password-{index}.png
    Click Element    xpath://label[@for='checkbox1']
    Submit Form
    Wait Until Element Is Visible    xpath://li[contains(text(),'These credentials do not match our records.')]
    Element Text Should Be    xpath://li[contains(text(),'These credentials do not match our records.')]    These credentials do not match our records.
    ${alert} =    Get Text    xpath://li[contains(text(),'These credentials do not match our records.')]
    Log To Console    ${alert}
    Capture Page Screenshot    patient-login-failure-{index}.png

User login - success
    Go To    ${TESTURL}
    Input Text    name:email    ${USEREMAIL}
    Input Text    name:password    @{PATIENT}[0]
    Capture Page Screenshot    patient-old-password-{index}.png
    Submit Form
    Capture Page Screenshot    patient-login-success-{index}.png
    LogoutKW

User change password - fail
    Login Business KW
    Click Element    id:m_aside_left_offcanvas_toggle
    Click Link    /profile
    Click Element    id:chan_pass
    Capture Page Screenshot    patient-goto-change-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'Current password')]    Current password
    Element Should Be Enabled    id:current
    Input Text    id:current    @{PATIENT}[0]
    Capture Page Screenshot    patient-current-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'New password')]    New password
    Element Text Should Be    xpath://label[contains(text(),'Confirm password')]    Confirm password
    Click Element    id:savePasswordBtn
    ${alert} =    Get Text    xpath://li[contains(text(),'Password field is required.')]
    Log To Console    ${alert}
    Should Contain    xpath://li[contains(text(),'Password field is required.')]    Password field is required.
    Capture Page Screenshot    patient-password-field-id-required-{index}.png
    Click Element    xpath://a[contains(text(),'Change password')]
    Input Text    id:current    @{PATIENT}[0]
    Element Text Should Be    xpath://label[contains(text(),'New password')]    New password
    Element Should Be Enabled    id:new1
    Input Text    id:new1    short
    Capture Page Screenshot    patient-new-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'Confirm password')]    Confirm password
    Element Should Be Enabled    id:new2
    Input Text    id:new2    invalid
    Capture Page Screenshot    patient-confirm-new-password-{index}.png
    Click Element    id:savePasswordBtn
    ${least} =    Get Text    xpath://li[contains(text(),'The password must be at least 8 characters')]
    Log To Console    ${least}
    Should Contain    xpath://li[contains(text(),'The password must be at least 8 characters.')]    The password must be at least 8 characters.
    ${not_match} =    Get Text    xpath://li[contains(text(),'The password confirmation does not match')]
    Log To Console    ${not_match}
    Should Contain    xpath://li[contains(text(),'The password confirmation does not match.')]    The password confirmation does not match
    ${invalid} =    Get Text    xpath://li[contains(text(),'The password format is invalid.')]
    Log To Console    ${invalid}
    Should Contain    xpath://li[contains(text(),'The password format is invalid.')]    The password format is invalid.
    Capture Page Screenshot    patient-change-password-failure-{index}.png
    Click Element    id:chan_pass
    Input Text    id:new1    ${ADMINPW}
    Input Text    id:new2    ${ADMINPW}
    Click Element    id:savePasswordBtn
    Capture Page Screenshot    current-password-field-is-required-{index}.png
    ${required_password} =    Get Text    xpath://li[contains(text(),'The current password field is required.')]
    Log To Console    ${required_password}
    LogoutKW

User change password - success
    Login Business KW
    Wait Until Element Is Visible    id:m_aside_left_offcanvas_toggle
    Click Element    id:m_aside_left_offcanvas_toggle
    Wait Until Element Is Visible    xpath://span[contains(text(),'Profile')]
    Click Element    xpath://span[contains(text(),'Profile')]
    Click Element    xpath://a[contains(text(),'Change password')]
    Capture Page Screenshot    patient-goto-change-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'Current password')]    Current password
    Input Text    id:current    @{PATIENT}[0]
    Capture Page Screenshot    patient-current-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'New password')]    New password
    Input Text    id:new1    @{PATIENT}[1]
    Capture Page Screenshot    patient-new-password-{index}.png
    Element Text Should Be    xpath://label[contains(text(),'Confirm password')]    Confirm password
    Input Text    id:new2    @{PATIENT}[1]
    Capture Page Screenshot    patient-confirm-new-password-{index}.png
    Click Element    id:savePasswordBtn
    Capture Page Screenshot    patient-changed-password-success{index}.png
    ${alert} =    Get Text    class:alert-success
    Log To Console    ${alert}
    Should Contain    Password changed successfully.    Password changed successfully.
    LogoutKW

User login with old password - failure
    Go To    ${TESTURL}
    Clear Element Text    name:email
    Input Text    name:email    ${USEREMAIL}
    #Capture Page Screenshot    patient-email-{index}.png
    Clear Element Text    name:password
    Input Password    name:password    @{PATIENT}[0]
    Capture Page Screenshot    patient-old-password-{index}.png
    Submit Form
    ${old} =    Get Text    xpath://li[contains(text(),'These credentials do not match our records.')]
    Log To Console    ${old}
    Element Text Should Be    xpath://li[contains(text(),'These credentials do not match our records.')]    These credentials do not match our records.
    Capture Page Screenshot    patient-old-pass-failure-{index}.png

User login with changed password - success
    Go To    ${TESTURL}
    Clear Element Text    name:email
    Input Text    name:email    ${USEREMAIL}
    #Capture Page Screenshot    patient-email-{index}.png
    Clear Element Text    name:password
    Input Password    name:password    @{PATIENT}[1]
    Capture Page Screenshot    patient-new-password-{index}.png
    Click Element    xpath://label[@for='checkbox1']
    Submit Form
    Wait Until Element Is Visible    xpath://h3[@class='m-subheader__title m-subheader__title--separator m-pageheading']
    Element Text Should Be    xpath://h3[@class='m-subheader__title m-subheader__title--separator m-pageheading']    Doctors
    Capture Page Screenshot    patient-login-with-new-password-{index}.png
    Log    Patient has successfully login
    #Wait Until Element Is Visible    xpath://div[@class='toast-message']
    #Click Element    xpath://div[@class='toast-message']
    LogoutKW
    [Teardown]

*** Keywords ***
