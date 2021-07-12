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
@{FEELANCER}      Password##99    Password##88

*** Test Cases ***
Login
    UFJLogin
    Login Freelancer KW

Go to Profile Settings
    Click Link    /profile
    Wait Until Element Is Visible    class=ProfileDashboard_profileSettingsLink__y9D6Y
    Click Link    /profile-settings/personal
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Password & Security')]
    Click Link    /profile-settings/security

Go to Password and Security
    Capture Page Screenshot    password-and-security-{index}.png
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Password & Security')]
    Element Should Be Visible    xpath=//h2[contains(text(),'Password & Security')]
    Element Text Should Be    xpath=//h2[contains(text(),'Password & Security')]    Password & Security
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Password & Two Factor Authentication')]
    Element Should Be Visible    xpath=//div[contains(text(),'Password & Two Factor Authentication')]
    Element Text Should Be    xpath=//div[contains(text(),'Password & Two Factor Authentication')]    Password & Two Factor Authentication
    #Login Devices
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Login Devices')]
    Element Should Be Visible    xpath=//div[contains(text(),'Login Devices')]
    Element Text Should Be    xpath=//div[contains(text(),'Login Devices')]    Login Devices
    Capture Element Screenshot    xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[2]
    #Login
    Security login assertation
    Security password assertation
    Click Element    xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/button[1]/div[1]
    Capture Page Screenshot    after-click-edit-button-{index}.png
    Security password input
    Click Element    xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/button[1]
    Capture Page Screenshot    after-click-edit-button-{index}.png
    Element Text Should Not Be    xpath=//section[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[4]/div[1]/div[2]/form[1]/button[1]    Edit
    #alert message - Required!
    Security password required fields

Change Password
    Input Text    id=password    invalid
    Input Text    id=confirmedPassword    @{FREELANCER}[0]
    Click Element    class=fa-eye-slash
    Capture Element Screenshot    new-password-{index}.png
    Click Button    xpath=//div[4]/div[1]/div[2]/form[1]/button[1]

Logout
    LogoutKW
