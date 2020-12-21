*** Settings ***
Documentation     Test login and logout with ${DOCEMAIL}
...
...               Test login and logout with ${ADMIN}
...
...               Test activation user with ${ADMIN}
...
...               Test login with ${DOCEMAIL} positive and negative test scenario.
...
...               Assert all pages which include steps in test cases.
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Test Setup
Library           SeleniumLibrary
Library           String
Library           XvfbRobot
Resource          _mysetup.txt
Resource          _keywords.txt

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
doctor registration - success
    [Tags]    doctor.register
    Maximize Browser Window
    Go To    ${TESTURL}
    Capture Page Screenshot    register-new-doctor-goto-{index}.png
    Wait Until Element Is Visible    xpath://a[contains(text(),'Register')]
    Click Link    /register
    Registration page
    Capture Page Screenshot    register-new-doctor-{index}.png
    Submit Form
    Registration Required fields
    Click Element    xpath://label[@for='doctor']
    Capture Page Screenshot    register-new-doctor-role-{index}.png
    Click Element    xpath://label[@for='female']
    Capture Page Screenshot    register-new-doctor-gender-{index}.png
    ${doctor_radnom_name} =    Generate Random String    5    [UPPER]
    ${doctor_radnom_name}=    Set Variable    ${doctor_radnom_name}
    Set Suite Variable    ${doctor_radnom_name}
    Input Text    name:first_name    ${doctor_radnom_name}
    Capture Page Screenshot    register-new-doctor-firstname-{index}.png
    ${doctor_radnom_last_name} =    Generate Random String    5    [UPPER]
    ${doctor_radnom_last_name} =    Set Variable    ${doctor_radnom_last_name}
    Set Suite Variable    ${doctor_radnom_last_name}
    Input Text    name:last_name    ${doctor_radnom_last_name}
    Capture Page Screenshot    register-new-doctor-lastname-{index}.png
    ${doctor_radnom_email} =    Generate Random String    3    [NUMBERS]
    ${doctor_radnom_email}=    Set Variable    doctor-${doctor_radnom_email}-email-${email}
    Set Suite Variable    ${doctor_radnom_email}
    Input Text    name:email    ${doctor_radnom_email}
    Capture Page Screenshot    register-random-doctor-email-{index}.png
    Input Text    name:password    ${DOCPW}
    Capture Page Screenshot    register-new-doctor-password-{index}.png
    Input Password    name:password_confirmation    ${DOCPW}
    Capture Page Screenshot    register-new-doctor-confirm-password-{index}.png
    Click Element    name:check_agreement
    Capture Page Screenshot    register-new-doctor-check-ageement-{index}.png
    Submit Form
    Capture Page Screenshot    register-new-doctor-signin-{index}.png
    LogoutKW

doctor activation
    [Tags]    doctor.register
    LoginAdminKW
    Capture Page Screenshot    log-as-admin-{index}.png
    Wait Until Element Is Visible    id:m_aside_left_offcanvas_toggle
    Click Element    id:m_aside_left_offcanvas_toggle
    Click Element    xpath://span[contains(text(),'Not confirmed')]
    Click Element    xpath://label[contains(text(),'Search:')]//input
    Input Text    xpath://label[contains(text(),'Search:')]//input    ${doctor_radnom_email}
    Capture Page Screenshot    input-in-searchbar-doctor-random-email-(index).png
    Wait Until Element Is Visible    xpath://tr[1]//td[1]
    Element Text Should Be    xpath://tr[1]//td[1]    ${doctor_radnom_name}
    Wait Until Element Is Visible    xpath://tr[1]//td[2]
    Element Text Should Be    xpath://tr[1]//td[2]    ${doctor_radnom_last_name}
    Wait Until Element Is Visible    xpath://tr[1]//td[4]
    Element Text Should Be    xpath://tr[1]//td[4]    ${doctor_radnom_email}
    Capture Page Screenshot    search-doctor-{index}.png
    Wait Until Element Contains    xpath://th[contains(text(),'Actions')]    Actions
    Click Element    xpath://a[@class='btn btn-success m-btn m-btn--icon m-btn--icon-only']
    Capture Page Screenshot    admin-actions-{index}.png
    Click Element    xpath://a[contains(text(),'Admin')]
    Admin Activation Edit User page
    Capture Page Screenshot    before-activate-{index}.png
    Click Element    xpath://div[7]/form/div/div/div/div/label[1]    #activate
    Capture Page Screenshot    after-clicking-activate-{index}.png
    Click Button    //div[@id='m_user_profile_tab_9']//button[@class='btn btn-primary m-btn m-btn--custom'][contains(text(),'Save changes')]
    ${alert-success} =    Get Text    class:alert-success
    Log To Console    ${alert-success}
    Capture Page Screenshot    admin-configuration-updated-successfully-{index}.png
    Click Element    xpath://a[contains(text(),'Admin')]
    Scroll Element Into View    xpath://div[@id='m_user_profile_tab_9']//button[@class='btn btn-primary m-btn m-btn--custom'][contains(text(),'Save changes')]
    Capture Page Screenshot    after-admin-configuration-updated-successfully-{index}.png
    LogoutKW

doctor login test - failure
    [Tags]    doctor.register
    Go To    ${TESTURL}
    Login page
    Click Element    name:email
    Input Text    name:email    ${doctor_radnom_email}
    ${RANDOM} =    Generate Random String    3    [NUMBERS]
    Capture Page Screenshot    random-doctor-email-{index}.png
    Input Text    name:password    ${RANDOM}
    Click Element    name:password
    Capture Page Screenshot    random-doctor-password-{index}.png
    Submit Form
    Element Should Contain    xpath://li[contains(text(),'These credentials do not match our records.')]    These credentials do not match our records.
    Wait Until Element Contains    xpath://li[contains(text(),'These credentials do not match our records.')]    These credentials do not match our records.
    Capture Page Screenshot    login-failure-{index}.png

doctor login test - success
    [Documentation]    doctor login test - success
    [Tags]    doctor.register
    Go To    ${TESTURL}
    Login page
    Clear Element Text    name:email
    Input Text    name:email    ${doctor_radnom_email}
    Capture Page Screenshot    random-doctor-email-{index}.png
    Clear Element Text    name:password
    Input Password    name:password    ${DOCPW}
    Capture Page Screenshot    doctor-password-{index}.png
    Click Element    xpath://label[@for='checkbox1']
    Capture Page Screenshot    check-checkbox-{index}.png
    Submit Form
    Log    Patient has successfully login
    Capture Page Screenshot    after-login-success-{index}.png

doctor logout - success
    [Documentation]    doctor logout - success
    [Tags]    doctor.register
    Capture Page Screenshot    before-offcanvas-toggle-{index}.png
    Click Element    id:m_aside_left_offcanvas_toggle
    Wait Until Element Is Visible    xpath://span[contains(text(),'Logout')]
    Capture Page Screenshot    before-logout-{index}.png
    Click Link    /logout
    Capture Page Screenshot    user-logout-{index}.png
    Log    Patient has successfully logged out

doctor access my appointment
    [Tags]    doctor.register
    Go To    ${TESTURL}
    Login page
    Input Text    name:email    ${doctor_radnom_email}
    Capture Page Screenshot    doctor-random-email-{index}.png
    Input Text    name:password    ${DOCPW}
    Capture Page Screenshot    dctor-password-{index}.png
    Submit Form
    Capture Page Screenshot    after-submit-{index}.png
    Click Element    id:m_aside_left_offcanvas_toggle
    Capture Page Screenshot    offcanvas-toggle-{index}.png
    Wait Until Element Is Visible    xpath://span[contains(text(),'My appointments')]
    Click Element    xpath://span[contains(text(),'My appointments')]
    Wait Until Element Is Visible    xpath://h3[@class='m-subheader__title m-pageheading']
    Element Text Should Be    xpath://h3[@class='m-subheader__title m-pageheading']    Appointments
    Wait Until Element Is Visible    xpath://div[@class='alert alert-danger']
    ${alert-danger} =    Get Text    class:alert-danger
    Log To Console    ${alert-danger}
    Capture Page Screenshot    no-any-record-found-{index}.png
    LogoutKW
    [Teardown]

inactive and delete doctor
    [Tags]    doctor.register
    LoginAdminKW
    Wait Until Element Is Visible    xpath://label[contains(text(),'Search:')]
    Wait Until Element Is Visible    xpath://label[contains(text(),'Search:')]//input
    Input Text    xpath://label[contains(text(),'Search:')]//input    ${doctor_radnom_email}
    Sleep    3
    Capture Page Screenshot    before-delete-doctor-user-{index}.png
    Wait Until Element Is Visible    xpath://tr[1]//td[4]
    Element Text Should Be    xpath://tr[1]//td[4]    ${doctor_radnom_name}
    Wait Until Element Is Visible    xpath://tr[1]//td[5]
    Element Text Should Be    xpath://tr[1]//td[5]    ${doctor_radnom_last_name}
    Click Element    xpath://a[contains(@class,'btn btn-danger m-btn m-btn--icon m-btn--icon-only show-delete-modal')]
    Wait Until Element Is Visible    xpath://button[@class='btn btn-primary']
    Capture Page Screenshot    modal-delete-button-{index}.png
    Click Element    xpath://button[@class='btn btn-primary']
    Capture Page Screenshot    delete-modal-{index}.png
    Wait Until Element Is Visible    id:m_aside_left_offcanvas_toggle
    Click Element    id:m_aside_left_offcanvas_toggle
    Wait Until Element Is Visible    xpath://span[contains(text(),'Not confirmed')]
    Click Element    xpath://span[contains(text(),'Not confirmed')]
    Input Text    xpath://label[contains(text(),'Search:')]//input    ${doctor_radnom_email}
    Sleep    2
    Wait Until Element Is Visible    xpath://tr[1]//td[1]
    Element Text Should Be    xpath://tr[1]//td[1]    ${doctor_radnom_name}
    Wait Until Element Is Visible    xpath://tr[1]//td[2]
    Element Text Should Be    xpath://tr[1]//td[2]    ${doctor_radnom_last_name}
    Wait Until Element Is Visible    xpath://tr[1]//td[4]
    Element Text Should Be    xpath://tr[1]//td[4]    ${doctor_radnom_email}
    Capture Page Screenshot    before-delete-doctor-user-{index}.png
    Wait Until Element Is Visible    xpath://table[1]/tbody[1]/tr[1]/td[6]/a[3]
    Click Element    xpath://table[1]/tbody[1]/tr[1]/td[6]/a[3]
    Capture Page Screenshot    delete-doctor-user-{index}.png
    Click Element    id:footer_action_button2
    Capture Page Screenshot    after-delete-doctor-user-{index}.png
    LogoutKW

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
