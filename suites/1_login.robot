*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Resource          _keywords.txt
Resource          _mysetup.txt
Library           String
Library           SeleniumLibrary

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login
    [Documentation]    Login to the platform Upforjobs
    [Tags]    login
    UFJLogin
    Sleep    1

Login password is incorrect
    [Documentation]    Negative test scenario
    ...    - In this test we are testing login modal dialog
    ...    assert and verify elements in the modal dialog, input fileds and alert message
    ...    - input valid username or email
    ...    - input invalid password
    ...    - click button Login
    ...    invalid password should trigger alert message
    ...    - Password is incorrect
    ...    - Capture page screenshot
    ...    - Click on the alert message to close an alert message
    [Tags]    login
    Wait Until Element Is Visible    id=login
    Click Element    id=login
    Login modal dialog
    Input Text    name=emailOrUserName    ${ufjfreelancer}
    Input Text    name=password    invalid
    Click Button    id=login
    Wait Until Element Is Visible    xpath://div[contains(text(),'Password is incorrect')]
    Element Should Be Visible    xpath://div[contains(text(),'Password is incorrect')]
    Log To Console    xpath://div[contains(text(),'Password is incorrect')]
    Element Text Should Be    xpath://div[contains(text(),'Password is incorrect')]    Password is incorrect
    Capture Page Screenshot    password-is-incorrect-{index}.png
    Click Element    xpath://div[contains(text(),'Password is incorrect')]
    Wait Until Element Is Not Visible    xpath://div[contains(text(),'Password is incorrect')]
    Log To Console    Test pass with sucess

Login - missing login details
    [Documentation]    Negative test scenario
    ...    - In this test we are testing that
    ...    - username or email and password are
    ...    - * Required fileds
    ...    Open modal dialog and click Login button
    ...    An alert message under the inputfields text should be
    ...    - Required
    [Tags]    login
    Wait Until Element Is Visible    xpath=//div[@id='login']
    Click Element    xpath=//div[@id='login']
    Click Button    id:login
    Capture Page Screenshot    login-details-{index}.png
    Wait Until Element Is Visible    id=emailUserError
    Element Should Be Visible    id=emailUserError
    Element Text Should Be    id=emailUserError    * Required    #Please enter login details
    Capture Element Screenshot    id=emailUserError
    Wait Until Element Is Visible    id=passwordError
    Element Should Be Visible    id=passwordError
    Element Text Should Be    id=passwordError    * Required
    Capture Element Screenshot    id=passwordError
    Capture Element Screenshot    class=Login_loginCard__3VHjo

At least 3 characters
    [Documentation]    Negative test scenario
    ...    - In this test we are testing username or elamil input filed minimum lenght charracters
    ...    - inut 2 letters
    ...    - alert message with the text
    ...    - Email or Username must be at least 3 characters
    [Tags]    login
    Wait Until Element Is Enabled    name=emailOrUserName
    ${name} =    Generate Random String    2    [NUMBERS]
    Input Text    name=emailOrUserName    ${name}
    Input Text    name:password    ${name}
    Click Button    id:login
    Sleep    1
    Capture Page Screenshot    login-details-{index}.png
    Wait Until Element Is Visible    xpath=//div[@id='emailUserError']
    Element Should Be Visible    xpath=//div[@id='emailUserError']
    Element Text Should Be    xpath=//div[@id='emailUserError']    Email or Username must be at least 3 characters
    Click Element    xpath=//div[contains(text(),'Signup')]
    Click Element    xpath=//div[contains(text(),'Login')]

Login - User not found
    [Documentation]    Negarive test scenario
    ...    - in this test we are testing username data base recognision
    ...    - in username or email input filed input radnom letters using the variables and random Password
    ...    an alert message with the text should be presented
    ...    - user not found
    [Tags]    login
    Delete All Cookies
    Wait Until Element Is Visible    xpath=//p[contains(.,'Sign In')]
    ${name} =    Generate Random String    8    [LETTERS]
    Input Text    name=emailOrUserName    ${name}
    Input Text    name=password    invalid
    Click Button    id:login
    Capture Page Screenshot    login-details-{index}.png
    Wait Until Element Is Visible    xpath://div[contains(text(),'User not found.')]
    Element Should Be Visible    xpath://div[contains(text(),'User not found.')]
    Element Text Should Be    xpath://div[contains(text(),'User not found.')]    User not found.
    Capture Element Screenshot    xpath://div[contains(text(),'User not found.')]
    Sleep    1
    Click Element    xpath://div[contains(text(),'User not found.')]
    Click Element    xpath=//div[contains(text(),'Signup')]
    Click Element    xpath=//div[contains(text(),'Login')]

Login with the username - log out
    [Documentation]    Poitive test scenario
    ...    - in this tes we are testing login and logout test scenario
    ...    - asswert and verify login modal dialog using the keywor Login Modal Dialog
    ...    - asswer and verify elements inthe modal
    ...    - input correct username and password
    ...    - assert Home page using nabar header keword
    ...    capture page screenshout and logout using keyword logout
    [Tags]    login
    #Wait Until Element Is Visible    xpath=//p[contains(.,'Sign In')]
    #Click Element    xpath=//p[contains(.,'Sign In')]
    Login modal dialog
    Input Text    name=emailOrUserName    Freelancer
    Input Text    name=password    ${password}
    Click Element    id=login
    Wait Until Element Is Visible    class=MiniDashboard_miniDashboard__2g2df
    LogoutKW

Login with the email - log out
    [Tags]    login
    Wait Until Element Is Visible    xpath=//p[contains(.,'Sign In')]
    Click Element    xpath=//p[contains(.,'Sign In')]
    Login modal dialog
    Input Text    name=emailOrUserName    ${ufjfreelancer}${gmail}
    Input Text    name=password    ${password}
    Capture Page Screenshot    landing-page-{index}.png
    Wait Until Element Is Visible    id=login
    Wait Until Element Is Enabled    id=login
    Click Element    id=login
    Sleep    1
    Capture Page Screenshot    landing-page-{index}.png
    Sleep    1
    LogoutKW

Login with Google
    [Tags]    login
    Sleep    2
    Click Element    xpath=//p[contains(.,'Sign In')]
    Login modal dialog
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Gmail')]
    Click Element    xpath=//p[contains(text(),'Gmail')]
    Sleep    2
    Capture Page Screenshot    google-login-{index}.png

Login with FB
    [Documentation]    Poitive test scenario
    ...    - In this tes we are testing buttons for login social network modal dialog
    ...    Clicking on the Social button FB \ - login with FB Login modal dialog shpould be presented
    ...    - Capture page screenshot
    [Tags]    login
    Sleep    1
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Facebook')]
    Click Element    xpath=//p[contains(text(),'Facebook')]
    Sleep    2
    Capture Page Screenshot    fb-login-{index}.png

Login with Linkedin
    [Tags]    login
    Sleep    1
    Login modal dialog
    Wait Until Element Is Visible    class=LinkedinLogin_linkedinLogin__2bBmo
    Click Element    class=LinkedinLogin_linkedinLogin__2bBmo
    Sleep    2
    Capture Page Screenshot    linkedin-login-{index}.png
