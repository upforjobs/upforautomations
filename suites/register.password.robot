*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Test Setup
Library           SeleniumLibrary
Library           XvfbRobot
Library           String
Resource          _keywords.txt
Resource          _mysetup.txt

*** Variables ***
${TMP_PATH}       /tmp
# @todo conditions, loops, etc: https://blog.codecentric.de/en/2013/05/robot-framework-tutorial-loops-conditional-execution-and-more/
# @todo generate testdata: http://seleniummaster.com/sitecontent/index.php/selenium-robot-framework-menu/selenium-robot-framework-python-menu/273-generate-test-data-in-robot-framework-example-four

*** Test Cases ***
Invalid password
    [Tags]
    Maximize Browser Window
    GoTo    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Join Now!')]
    ${RANDOM} =    Generate Random String    4    [NUMBERS]
    Input Text    name:email    short8-${RANDOM}-${email}
    Input Text    name:username    robot-delete
    Input Text    name:password    short8
    Click Element    xpath://button[contains(text(),'Sign up')]
    Capture Page Screenshot    register-{index}.png
    Element Text Should Be    xpath://div[contains(text(),'Password must contain min 8 characters: at least o')]    Password must contain min 8 characters: at least one lowercase letter, one uppercase letter, one numeric digit, and one special character

Incorrect input fields
    [Tags]
    GoTo    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Join Now!')]
    Clear Element Text    name:email
    Clear Element Text    name:username
    Clear Element Text    name:password
    Click Element    xpath://button[contains(text(),'Sign up')]
    Element Text Should Be    xpath://div[contains(text(),'Email field is required')]    Email field is required
    Element Text Should Be    xpath://div[contains(text(),'Password field is required')]    Password field is required
    Element Text Should Be    xpath://div[contains(text(),'Username field is required')]    Username field is required

Incorrect Email format
    [Tags]
    GoTo    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Join Now!')]
    Input Text    name:email    email
    Click Element    xpath://button[contains(text(),'Sign up')]
    Element Text Should Be    xpath://div[contains(text(),'Incorrect Email format')]    Incorrect Email format

Already taken username
    GoTo    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Join Now!')]
    ${RANDOM} =    Generate Random String    4    [NUMBERS]
    Input Text    name:email    zarko${email}
    Input Text    name:username    Zarko
    Input Text    name:password    ${password}
    Click Element    xpath://button[contains(text(),'Sign up')]
    Capture Page Screenshot    register-{index}.png
    Wait Until Element Is Visible    xpath://div[contains(text(),'Email or Username is taken')]
    Element Text Should Be    xpath://div[contains(text(),'Email or Username is taken')]    Email or Username is taken
    Sleep    prelounch
    Wait Until Element Is Visible    xpath://div[contains(text(),'Email or Username is taken')]
    Click Element    xpath://div[contains(text(),'Email or Username is taken')]
    Wait Until Element Is Not Visible    xpath://div[contains(text(),'Email or Username is taken')]
