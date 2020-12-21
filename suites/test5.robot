*** Settings ***
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
user registration - success
    [Tags]    patient.register
    Capture Page Screenshot    register-patient-gender-{index}.png
    ${patient_radnom_name} =    Generate Random String    6    [UPPER]
    ${patient_radnom_name} =    Set Variable    ${patient_radnom_name}
    Set Suite Variable    ${patient_radnom_name}
    Input Text    name:first_name    ${patient_radnom_name}
    Capture Page Screenshot    register-new-patient-firstname-{index}.png
    ${patient_radnom_last_name} =    Generate Random String    7    [UPPER]
    ${patient_radnom_last_name} =    Set Variable    ${patient_radnom_last_name}
    Set Suite Variable    ${patient_radnom_last_name}
    Input Text    name:last_name    ${patient_radnom_last_name}
    Capture Page Screenshot    register-patient-firstname-{index}.png
    ${patient_radnom_email} =    Generate Random String    7    [NUMBERS]
    ${patient_radnom_email} =    Set Variable    patient-${patient_radnom_email}-email-${email}
    Set Suite Variable    ${patient_radnom_email}
    Input Text    name:email    ${patient_radnom_email}
    Capture Page Screenshot    register-random-patient-email-{index}.png
    Input Text    name:password    ${USERPW}
    Capture Page Screenshot    register-patient-password-{index}.png
    Input Password    name:password_confirmation    ${USERPW}
    Capture Page Screenshot    register-patient-password-confirmation-{index}.png
    Click Element    name:check_agreement
    Capture Page Screenshot    register-patient-check-ageement-{index}.png
    Scroll Element Into View    xpath://button[contains(@type,'submit')]
    Capture Page Screenshot    before-submit-{index}.png
    Click Button    xpath://button[contains(@type,'submit')]
    Capture Page Screenshot    register-patient-signin-{index}.png
    LogoutKW
    Capture Page Screenshot    register-patient-logout-{index}.png

user activation
    [Documentation]    user activation -by admin
    [Tags]    patient.register
    LoginAdminKW
    Click Element    id:m_aside_left_offcanvas_toggle
    Click Element    xpath://span[contains(text(),'Not confirmed')]
    Click Element    xpath://label[contains(text(),'Search:')]//input
    Input Text    xpath://label[contains(text(),'Search:')]//input    ${patient_radnom_email}
    Wait Until Element Contains    xpath://th[contains(text(),'Actions')]    Actions
    Click Element    xpath://a[@class='btn btn-success m-btn m-btn--icon m-btn--icon-only']
    Click Element    xpath://a[contains(text(),'Admin')]
    Admin Activation Edit User page
    #Select Radio Button    name:status    1
    Click Element    xpath://div[@id='m_user_profile_tab_9']//div[@class='m-radio-inline']//label[1]
    Click Button    xpath://div[@id='m_user_profile_tab_9']//button[@class='btn btn-primary m-btn m-btn--custom'][contains(text(),'Save changes')]
    ${alert-success} =    Get Text    class:alert-success
    Log To Console    ${alert-success}
    LogoutKW

user login test - failure
    [Documentation]    user login test - failure - wrong pass
    [Tags]    patient.register
    Go To    ${TESTURL}
    Login page
    Input Text    name:email    ${patient_radnom_email}
    ${RANDOM} =    Generate Random String    5    [NUMBERS]
    Input Text    name:password    ${RANDOM}
    Click Element    name:password
    Submit Form
    Element Should Contain    xpath://li[contains(text(),'These credentials do not match our records.')]    These credentials do not match our records.
    Wait Until Element Contains    xpath://li[contains(text(),'These credentials do not match our records.')]    These credentials do not match our records.
    Capture Page Screenshot    login-failure-{index}.png

user login test - success
    [Documentation]    user login test - success
    [Tags]    patient.register
    Go To    ${TESTURL}
    Login page
    Clear Element Text    name:email
    Input Text    name:email    ${patient_radnom_email}
    Capture Page Screenshot    user-email-{index}.png
    Clear Element Text    name:password
    Input Password    name:password    ${USERPW}
    Capture Page Screenshot    user-password-{index}.png
    Click Element    xpath://label[@for='checkbox1']
    Submit Form
    Log    Patient has successfully login

user logout - success
    [Documentation]    user logout - success
    [Tags]    patient.register
    Click Element    id:m_aside_left_offcanvas_toggle
    Wait Until Element Is Visible    xpath://span[contains(text(),'Logout')]
    Click Link    /logout
    Capture Page Screenshot    user-logout-{index}.png
    Log    Patient has successfully logged out

user access my appointments
    [Documentation]    User access to My appointment
    [Tags]    patient.register
    Go To    ${TESTURL}
    Login page
    Input Text    name:email    ${patient_radnom_email}
    Input Text    name:password    ${USERPW}
    Submit Form
    Click Element    id:m_aside_left_offcanvas_toggle
    Click Element    xpath://span[contains(text(),'My appointments')]
    LogoutKW
    Capture Page Screenshot    user-after-logout-{index}.png
    [Teardown]

inactive and delete patient
    [Documentation]    Inactive adn delete patient from the table
    [Tags]    patient.register
    LoginAdminKW
    Sleep    1
    Input Text    xpath://label[contains(text(),'Search:')]//input    ${patient_radnom_email}
    Sleep    2
    Capture Page Screenshot    before-delete-doctor-user-{index}.png
    Click Element    xpath://a[contains(@class,'btn btn-danger m-btn m-btn--icon m-btn--icon-only show-delete-modal')]
    Sleep    2
    Click Element    xpath://button[@class='btn btn-primary']
    Sleep    1
    Capture Page Screenshot    delete-modal-{index}.png
    Click Element    id:m_aside_left_offcanvas_toggle
    Click Element    xpath://span[contains(text(),'Not confirmed')]
    Input Text    xpath://label[contains(text(),'Search:')]//input    ${patient_radnom_email}
    Sleep    2
    Capture Page Screenshot    before-delete-doctor-user-{index}.png
    Click Element    xpath://table[1]/tbody[1]/tr[1]/td[6]/a[3]
    Capture Page Screenshot    delete-doctor-user-{index}.png
    Sleep    1
    Click Element    id:footer_action_button2
    Capture Page Screenshot    after-delete-doctor-user-{index}.png
    Sleep    1
    LogoutKW

*** Keywords ***
Open Chrome Browser
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
