*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Test Setup
Library                 SeleniumLibrary
Library                 XvfbRobot
Library                 String
Resource                _keywords.txt
Resource                _mysetup.txt

*** Variables ***
${TMP_PATH}             /tmp
# @todo conditions, loops, etc: https://blog.codecentric.de/en/2013/05/robot-framework-tutorial-loops-conditional-execution-and-more/
# @todo generate testdata: http://seleniummaster.com/sitecontent/index.php/selenium-robot-framework-menu/selenium-robot-framework-python-menu/273-generate-test-data-in-robot-framework-example-four

*** Test Cases ***
Invalid password
          [Tags]          register
          Maximize Browser Window
          GoTo          ${TESTURL}
          Wait Until Element Is Visible          id=hire
          Click Element          id=hire
          ${RANDOM} =          Generate Random String          4          [NUMBERS]
          Input Text          name:email          short8-${RANDOM}-${email}
          Input Text          name:username          robot-delete
          Input Text          name:password          short8
          Click Element          xpath://button[contains(text(),'Sign up')]
          Capture Page Screenshot          invalid-password-must-contain-{index}.png
          Element Text Should Be          xpath://div[contains(text(),'Password must contain min 8 characters: at least o')]          Password must contain min 8 characters: at least one lowercase letter, one uppercase letter, one numeric digit, and one special character

Incorrect input fields
          [Tags]          register
          GoTo          ${TESTURL}
          Click Element          id=hire
          Clear Element Text          name:email
          Clear Element Text          name:username
          Clear Element Text          name:password
          Click Element          xpath://button[contains(text(),'Sign up')]
          Element Text Should Be          xpath://div[contains(text(),'email is a required field')]          email is a required field          #Email field is required
          Element Text Should Be          xpath://div[contains(text(),'password is a required field')]          password is a required field          #Password field is required
          Element Text Should Be          xpath://div[contains(text(),'username is a required field')]          username is a required field          #Username field is required
          Capture Element Screenshot          xpath://div[contains(text(),'email is a required field')]
          Capture Element Screenshot          xpath://div[contains(text(),'password is a required field')]
          Capture Element Screenshot          xpath://div[contains(text(),'username is a required field')]
          Capture Page Screenshot          incorrect-input-fields-{index}.png

Incorrect Email format
          [Tags]          register
          GoTo          ${TESTURL}
          Click Element          id=hire
          Input Text          name:email          incorrect
          Click Element          xpath://button[contains(text(),'Sign up')]
          Element Text Should Be          xpath://div[contains(text(),'email must be a valid email')]          email must be a valid email          #Incorrect Email format
          Capture Element Screenshot          xpath://div[contains(text(),'email must be a valid email')]
          Capture Page Screenshot          email-must-be-a-valid-email-{index}.png

Already taken username
          [Tags]          register
          Maximize Browser Window
          GoTo          ${TESTURL}
          Click Element          id=hire
          ${RANDOM} =          Generate Random String          4          [NUMBERS]
          Input Text          name:email          zarko${email}
          Input Text          name:username          ${user1}
          Input Text          name:password          ${password}
          Click Element          xpath://button[contains(text(),'Sign up')]
          Capture Page Screenshot          register-{index}.png
          Wait Until Element Is Visible          xpath://div[contains(text(),'Email or Username is taken')]
          Element Text Should Be          xpath://div[contains(text(),'Email or Username is taken')]          Email or Username is taken
          Capture Element Screenshot          xpath://div[contains(text(),'Email or Username is taken')]
          Capture Page Screenshot          email-or-username-{index}.png
          Wait Until Element Is Visible          xpath://div[contains(text(),'Email or Username is taken')]
          Click Element          xpath://div[contains(text(),'Email or Username is taken')]
          Wait Until Element Is Not Visible          xpath://div[contains(text(),'Email or Username is taken')]
