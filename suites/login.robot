*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          _keywords.txt
Resource          _mysetup.txt
Library           XvfbRobot
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login fresh user
    [Tags]
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Input Text    name:username    ${user1}
    Input Text    name:password    ${password}
    Click Element    id:login
    Wait Until Element Is Not Visible    xpath://button[contains(text(),'Login')]
    Wait Until Element Is Visible    xpath://div[@class="MiniDashboard_miniDashboard__2g2df"]
    Capture Page Screenshot    miniDashboard-{index}.png
    Click Link    /profile
    Wait Until Element Is Not Visible    xpath://div[@class="MiniDashboard_miniDashboard__2g2df"]
    Wait Until Element Is Visible    class:BreadCrumb_breadcrumbContainer__1e_Kg
    Capture Page Screenshot    BreadCrumb-{index}.png
    Click Link    /profile-settings
    Capture Page Screenshot    profile-settings-{index}.png
    Wait Until Element Is Visible    xpath://div[contains(text(),'Profile Settings')]
    Element Should Be Visible    xpath://div[contains(text(),'Profile Settings')]
    Element Text Should Be    xpath://div[contains(text(),'Profile Settings')]    Profile Settings
    Wait Until Element Is Visible    xpath://div[contains(text(),'MODE:')]
    Element Should Be Visible    xpath://div[contains(text(),'MODE:')]
    Element Text Should Be    xpath://div[contains(text(),'MODE:')]    MODE:
    Wait Until Element Is Visible    xpath://div[contains(text(),'visible')]
    Element Should Be Visible    xpath://div[contains(text(),'visible')]
    Element Text Should Be    xpath://div[contains(text(),'visible')]    visible
    Wait Until Element Is Visible    xpath://div[contains(text(),'Users can see you are online')]
    Element Should Be Visible    xpath://div[contains(text(),'Users can see you are online')]
    Element Text Should Be    xpath://div[contains(text(),'Users can see you are online')]    Users can see you are online
    Wait Until Element Is Visible    xpath://div[contains(text(),'GENDER:')]
    Element Should Be Visible    xpath://div[contains(text(),'GENDER:')]
    Element Text Should Be    xpath://div[contains(text(),'GENDER:')]    GENDER:
    Wait Until Element Is Visible    xpath://div[contains(text(),'Male')]
    Element Should Be Visible    xpath://div[contains(text(),'Male')]
    Element Text Should Be    xpath://div[contains(text(),'Male')]    Male
    Wait Until Element Is Visible    xpath://div[contains(text(),'Female')]
    Element Should Be Visible    xpath://div[contains(text(),'Female')]
    Element Text Should Be    xpath://div[contains(text(),'Female')]    Female
    Sleep    10
    Wait Until Element Is Visible
    Element Should Be Visible
    Element Text Should Be    \    STATUS:
    Wait Until Element Is Visible
    Element Should Be Visible
    Element Text Should Be
    Wait Until Element Is Visible
    Element Should Be Visible
    Element Text Should Be
    Wait Until Element Is Visible
    Element Should Be Visible
    Element Text Should Be
    Wait Until Element Is Visible
    Element Should Be Visible
    Element Text Should Be
    Logout

Login password is incorrect
    [Tags]    login
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Login modal dialog
    Input Text    name:username    ${user}
    Input Text    name:password    invalid
    Click Button    id:login
    Wait Until Element Is Visible    xpath://div[contains(text(),'Password is incorrect')]
    Element Should Be Visible    xpath://div[contains(text(),'Password is incorrect')]
    Element Text Should Be    xpath://div[contains(text(),'Password is incorrect')]    Password is incorrect
    Capture Page Screenshot    password-is-incorrect-{index}.png
    Click Element    xpath://div[contains(text(),'Password is incorrect')]
    Wait Until Element Is Not Visible    xpath://div[contains(text(),'Password is incorrect')]

Login - missing login details
    [Tags]    login
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Login modal dialog
    Click Button    id:login
    Capture Page Screenshot    login-details-{index}.png
    Wait Until Element Is Visible    xpath://p[contains(text(),'Please enter login details')]
    Element Should Be Visible    xpath://p[contains(text(),'Please enter login details')]
    Element Text Should Be    xpath://p[contains(text(),'Please enter login details')]    Please enter login details

Login - User not found
    [Tags]    login
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Login modal dialog
    Input Text    name:username    invalid
    Input Text    name:password    invalid
    Click Button    id:login
    Capture Page Screenshot    login-details-{index}.png
    Wait Until Element Is Visible    xpath://div[contains(text(),'User not found.')]
    Element Should Be Visible    xpath://div[contains(text(),'User not found.')]
    Element Text Should Be    xpath://div[contains(text(),'User not found.')]    User not found.

Login with FB
    [Tags]    login
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Login modal dialog
    Wait Until Element Is Visible    class:facebookLogin
    Click Element    class:facebookLogin
    Sleep    5
    #Wait Until Element Is Visible    id:platformDialogForm
    Capture Page Screenshot    fb-login-{index}.png

Login with Google
    [Tags]    login
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Login modal dialog
    Wait Until Element Is Visible    class:googleLogin
    Click Element    class:googleLogin
    Sleep    5
    #Wait Until Element Is Visible    class:Lth2jb
    Capture Page Screenshot    google-login-{index}.png

Login with Linkedin
    [Tags]    login
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Login modal dialog
    Wait Until Element Is Visible    class:linkedinLogin
    Click Element    class:linkedinLogin
    Sleep    5
    #Wait Until Element Is Visible    class:Lth2jb
    Capture Page Screenshot    linkedin-login-{index}.png

Login - log out
    [Tags]    login
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Input Text    name:username    ${user1}
    Input Text    name:password    ${password}
    Click Element    id:login
    Wait Until Element Is Visible    xpath://div[@class="MiniDashboard_miniDashboard__2g2df"]
    Click Element    xpath://div[@class="Avatar_avatar__container__6SBhX"]
    Wait Until Element Is Visible    xpath://div[@class="Avatar_avatar__container__6SBhX"]
    Wait Until Element Is Visible    class:navLogoutBtn
    Capture Page Screenshot    click-avatar-picture-logout-{index}.png
    Click Element    class:navLogoutBtn
    Capture Page Screenshot    click-avatar-picture-logout-{index}.png
    #modal logout
    Logout modal
    Click Element    xpath://button[@class="buttonBtn LogoutModal_logoutModalBtn__2fBDP"]
    Wait Until Element Is Visible    xpath://section[@class="hero"]
    Capture Page Screenshot    logout-{index}.png
