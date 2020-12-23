*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           XvfbRobot
Resource          _mysetup.txt
Resource          _keywords.txt
Library           DateTime
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Register user
    [Tags]    register
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Sleep    1
    Click Element    xpath://button[contains(text(),'Sign up')]
    Wait Until Element Is Visible    class:signupCard
    ${radnom_email} =    Generate Random String    7    [NUMBERS]
    ${radnom_email}=    Set Variable    business-${radnom_email}${email}
    Set Suite Variable    ${radnom_email}
    Input Text    name:email    ${radnom_email}
    Capture Page Screenshot    email-{index}.png
    Sleep    1
    ${username} =    Generate Random String    5    [UPPER]
    ${username} =    Set Variable    ${username}
    Set Suite Variable    ${username}
    Input Text    name:username    ${username}
    Capture Page Screenshot    username-{index}.png
    Sleep    1
    Input Password    name:password    ${password}
    Sleep    1
    Click Element    xpath://button[contains(text(),'Sign up')]
    Sleep    1
    Capture Page Screenshot    submit-{index}.png
    Sleep    1
    Wait Until Element Is Visible    class:modal-content
    Click Element    xpath://span[contains(text(),'×')]

Login user
    [Tags]    register
    Click Element    xpath://button[contains(text(),'Login')]
    Input Text    name:username    ${username}
    Input Text    name:password    ${password}
    Click Element    id:login
    Wait Until Element Is Not Visible    xpath://button[contains(text(),'Login')]
    Wait Until Element Is Visible    name:firstNameTutorial
    Capture Page Screenshot    register-user-{index}.png
    Logout

Email activation
    Go To    ${email_server}
    Sleep    prelounch
    Wait Until Element Is Visible    id:go_inbox
    Clear Element Text    id:inbox_field
    Input Text    id:inbox_field    ${radnom_email}
    Click Element    id:go_inbox
    Sleep    2
    Capture Page Screenshot    email-{index}.png
    Sleep    2
    Click Element    xpath://tbody/tr/td[3]
    Sleep    10
    Capture Page Screenshot    Welcome-{index}.png
    Click Element    xpath://button[contains(text(),'Login')]

Login
    Click Element    xpath://button[contains(text(),'Login')]
    Wait Until Element Is Visible    class:loginCard
    Input Text    name:username    ${username}
    Input Text    name:password    ${password}
    Wait Until Element Is Visible    id:login
    Click Element    id:login
    Sleep    3

Profile settings
    Sleep    prelounch
    Element Should Be Visible    class:Form_tutorial__text__1VWmD
    Click Element    name:firstNameTutorial
    #name
    ${radnom_name} =    Generate Random String    7    [LETTERS]
    Set Suite Variable    ${radnom_name}
    Input Text    id:firstName    business${radnom_name}
    Capture Page Screenshot    firstname-{index}.png
    #introduction
    Input Text    id:description    ${description}
    #lastname
    ${radnom_lastname} =    Generate Random String    7    [LETTERS]
    Set Suite Variable    ${radnom_lastname}
    Click Element    id:lastName
    Input Text    id:lastName    business${radnom_lastname}
    Capture Page Screenshot    firstname-{index}.png
    #dateOfBirth
    Input Text    id:dateOfBirth    06-11-1994
    Capture Page Screenshot    firstname-{index}.png
    #gender
    #Click Element    xpath://body/div[@id='root']/div[1]/section[1]/div[2]/div[3]/div[1]/form[1]/div[1]/div[7]/div[1]/div[1]/div[1]/div[1]/div[1]
    Capture Page Screenshot    gender-{index}.png
    #Country
    #Click Element    id:country
    Input Text    name:country    Canada
    Sleep    2
    #Click Element    xpath://option[contains(text(),'Canada')]
    #state
    Input Text    id:state    Alberta
    #city
    Input Text    id:city    Edmonton
    #street
    Input Text    id:street    Street 165
    #language
    #Click Element    class:DropDownSearch_input__fUy8M
    Input Text    class:DropDownSearch_input__fUy8M    Serbian
    Click Element    xpath://option[contains(text(),'Serbian')]
    Sleep    prelounch
    Click Element    class:DropDown_head__uLqnn
    Click Element    xpath://option[contains(text(),'Conversational')]
    Click Element    xpath://button[contains(text(),'Save')]
    Sleep    prelounch
    Wait Until Element Is Visible    xpath://div[contains(text(),'Profile Saved Successfully')]
    Capture Page Screenshot    save-profile-{index}.png

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
