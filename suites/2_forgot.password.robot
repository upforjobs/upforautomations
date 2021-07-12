*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Default Tags      forgot.password
Library           SeleniumLibrary
Library           String
Resource          _keywords.txt
Resource          _mysetup.txt

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login
    [Tags]    forgot.password
    UFJLogin

Forgot password
    [Documentation]    in this test case scenario we are testing the Login modal dialogforgot password modal dialogemail input field
    [Tags]    forgot.password
    Wait Until Element Is Visible    id=login
    Click Element    id=login
    Login modal dialog
    Click Element    id=forgotPassword
    Wait Until Element Is Visible    xpath=//nav[@id='nav-bar']/div[1]/form[1]
    Capture Page Screenshot    forgot-password-modal-dialog-{index}.png
    #forgot password modal dialog
    Forgot Password modal

Required field
    [Documentation]    Inthis test we are testing forgot modal dialog and * required field for the email
    [Tags]    forgot.password
    Click Element    xpath=//button[contains(text(),'Next')]
    Wait Until Element Is Visible    xpath=//p[contains(text(),'* Required!')]
    Element Should Be Visible    xpath=//p[contains(text(),'* Required!')]
    Element Text Should Be    xpath=//p[contains(text(),'* Required!')]    * Required!
    Capture Element Screenshot    class=ForgetPassword_forgetPasswordContainer__2Vsj4

Must be valid email
    [Documentation]    Inthis test we are testing forgot modal dialog and * required field for the email
    [Tags]    forgot.password
    Sleep    1
    ${invalidemail} =    Generate Random String    4    [LETTERS]
    ${invalidemail} =    Set Variable    ${invalidemail}
    Input Text    id=email    ${invalidemail}
    Sleep    1
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Must be valid email')]
    Element Should Be Visible    xpath=//p[contains(text(),'Must be valid email')]
    Element Text Should Be    xpath=//p[contains(text(),'Must be valid email')]    Must be valid email
    Capture Element Screenshot    class=ForgetPassword_forgetPasswordContainer__2Vsj4

User is Not Found
    [Documentation]    In this test we are testing that user is not exist in the system with given - random - \ email
    [Tags]    forgot.password
    Sleep    1
    Clear Element Text    id=email
    Sleep    3
    ${random} =    Generate Random String    6    [LETTERS]
    ${random} =    Set Variable    ${random}
    Input Text    id=email    ${random}
    Input Text    id=email    ${random}${email}
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Next')]
    Click Element    xpath=//button[contains(text(),'Next')]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'User not found')]
    Element Should Be Visible    xpath=//div[contains(text(),'User not found')]
    Element Text Should Be    xpath=//div[contains(text(),'User not found')]    User not found
    Capture Element Screenshot    class=ForgetPassword_forgetPasswordContainer__2Vsj4
    Capture Element Screenshot    xpath=//div[contains(text(),'User not found')]
    Click Element    xpath=//div[contains(text(),'User not found')]
    Sleep    1

Valid email
    [Documentation]    In this test, we are testing acceptance criteria for valid emails that users can submit to the open code modal dialog
    ...
    ...    Expected behavior is that element text Must be valid email should not appear and user should be able to see code modal dialogg
    [Tags]    forgot.password
    Wait Until Element Is Visible    id=login
    Click Element    id=login
    Click Element    id=forgotPassword
    Wait Until Element Is Visible    xpath=//nav[@id='nav-bar']/div[1]/form[1]
    Capture Page Screenshot    forgot-password-modal-dialog-{index}.png
    Forgot Password modal
    Sleep    1
    Clear Element Text    id=email
    Sleep    3
    Input Text    id=email    freelancer0${email}
    Element Should Not Be Visible    xpath=//p[contains(text(),'Must be valid email')]    Must be valid email
    Submit Form
    #Go To    ${email_server}
    #Sleep    3
    #Input Text    id=inbox_field    freelancer0
    #Click Element    xpath=//button[@id='go_inbox']
    #Sleep    1
    #Click Element    xpath=//tbody[1]/tr[1]/td[3]
    #Sleep    3
    Capture Page Screenshot    forgot-password-email-{index}.png

Code verification
    [Documentation]    In this test, we are using Code modal dialog keyword to assert and verify elements on the modal dilaog
    [Tags]    forgot.password
    Code modal dialog

Code Input required
    [Tags]    forgot.password
    Sleep    1
    Code modal dialog
    Submit Form
    Wait Until Element Is Visible    xpath=//p[contains(text(),'* Required!')]
    Element Should Be Visible    xpath=//p[contains(text(),'* Required!')]
    Element Text Should Be    xpath=//p[contains(text(),'* Required!')]    * Required!
    Capture Page Screenshot    class=EnterVerificationCode_verificationCard__28sBJ

Code must be at most 6 characters
    [Tags]    forgot.password
    Sleep    2
    ${code} =    Generate Random String    7    [LETTERS]
    ${code} =    Set Variable    ${code}
    Input Text    id=code    ${code}
    Wait Until Element Is Visible    xpath=//p[contains(text(),'* Code must be at most 6 characters')]
    Element Should Be Visible    xpath=//p[contains(text(),'* Code must be at most 6 characters')]
    Element Text Should Be    xpath=//p[contains(text(),'* Code must be at most 6 characters')]    * Code must be at most 6 characters
    Capture Element Screenshot    class=EnterVerificationCode_verificationCard__28sBJ

Code must be 6 alphanumeric keys
    [Tags]    forgot.password
    Sleep    2
    ${code} =    Generate Random String    5    [LETTERS]
    ${code} =    Set Variable    ${code}
    Input Text    id=code    ${code}
    Wait Until Element Is Visible    xpath=//p[contains(text(),'* Code must be 6 alphanumeric keys')]
    Element Should Be Visible    xpath=//p[contains(text(),'* Code must be 6 alphanumeric keys')]
    Element Text Should Be    xpath=//p[contains(text(),'* Code must be 6 alphanumeric keys')]    * Code must be 6 alphanumeric keys
    Capture Element Screenshot    class=EnterVerificationCode_verificationCard__28sBJ
