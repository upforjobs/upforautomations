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
          [Documentation]          In this test we are testing required fields and assert and verify an alert message with the text:
          ...          Password must contain min 8 characters: at least one lowercase letter, one uppercase letter, one numeric digit, and one special character
          ...          capture screen is attached.
          [Tags]          register
          Maximize Browser Window
          GoTo          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Signup')]
          Click Element          xpath=//a[contains(text(),'Signup')]
          Sign in modal
          ${RANDOM} =          Generate Random String          4          [NUMBERS]
          Input Text          name:email          short8-${RANDOM}-${email}
          Input Text          name:username          robot-delete
          Input Text          name:password          short8
          Click Element          css=.signUp
          Capture Page Screenshot          invalid-password-must-contain-{index}.png
          Element Text Should Be          xpath://div[contains(text(),'Password must contain min 8 characters: at least o')]          Password must contain min 8 characters: at least one lowercase letter, one uppercase letter, one numeric digit, and one special character

Incorrect input fields
          [Tags]          register
          Maximize Browser Window
          GoTo          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Signup')]
          Click Element          xpath=//a[contains(text(),'Signup')]
          Sign in modal
          Clear Element Text          name:email
          Clear Element Text          name:username
          Clear Element Text          name:password
          Click Element          css=.signUp
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Username is a required field')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Email is a required field')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Password is a required field')]
          Element Text Should Be          xpath=//div[contains(text(),'Username is a required field')]          Username is a required field          #Email field is required
          Element Text Should Be          xpath=//div[contains(text(),'Email is a required field')]          Email is a required field          #Password field is required
          Element Text Should Be          xpath=//div[contains(text(),'Password is a required field')]          Password is a required field          #Username field is required
          Capture Element Screenshot          class=SignUp_signupCard__8R2Z8
          Capture Page Screenshot          incorrect-input-fields-{index}.png

Incorrect Email format
          [Tags]          register
          Maximize Browser Window
          GoTo          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Signup')]
          Click Element          xpath=//a[contains(text(),'Signup')]
          Sign in modal
          Input Text          name:email          incorrect
          Click Element          css=.signUp
          Element Text Should Be          xpath://div[contains(text(),'email must be a valid email')]          email must be a valid email          #Incorrect Email format
          Capture Element Screenshot          xpath://div[contains(text(),'email must be a valid email')]
          Capture Page Screenshot          email-must-be-a-valid-email-{index}.png

Already taken username
          [Tags]          register
          Maximize Browser Window
          GoTo          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Signup')]
          Click Element          xpath=//a[contains(text(),'Signup')]
          Sign in modal
          ${RANDOM} =          Generate Random String          4          [NUMBERS]
          Input Text          name:email          zarko${email}
          Input Text          name:username          ${user1}
          Input Text          name:password          ${password}
          Click Element          css=.signUp
          Capture Page Screenshot          register-{index}.png
          Wait Until Element Is Visible          xpath://div[contains(text(),'Email or Username is taken')]
          Element Text Should Be          xpath://div[contains(text(),'Email or Username is taken')]          Email or Username is taken
          Capture Element Screenshot          xpath://div[contains(text(),'Email or Username is taken')]
          Capture Page Screenshot          email-or-username-{index}.png
          Wait Until Element Is Visible          xpath://div[contains(text(),'Email or Username is taken')]
          Click Element          xpath://div[contains(text(),'Email or Username is taken')]
          Wait Until Element Is Not Visible          xpath://div[contains(text(),'Email or Username is taken')]

Register with Google
          Maximize Browser Window
          GoTo          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Signup')]
          Click Element          xpath=//a[contains(text(),'Signup')]
          Sign in modal
          Click Element          xpath=//div[@id='googleLogin']
          Sleep          3
          Capture Page Screenshot          reg-google-{index}.png

Register with FB
          Maximize Browser Window
          GoTo          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Signup')]
          Click Element          xpath=//a[contains(text(),'Signup')]
          Sign in modal
          Click Element          xpath=//div[@id='facebookLogin']
          Sleep          3
          Capture Page Screenshot          reg-fb-{index}.png

Register with Linkedin
          Maximize Browser Window
          GoTo          ${TESTURL}
          Click Element          xpath=//p[contains(.,'Sign In')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Signup')]
          Click Element          xpath=//a[contains(text(),'Signup')]
          Sign in modal
          Click Element          xpath=//div[@id='linkedinLogin']
          Sleep          3
          Capture Page Screenshot          reg-linked-{index}.png
