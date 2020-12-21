*** Settings ***
Suite Setup       Open Chrome With Preferences
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           XvfbRobot
Resource          _mysetup.txt
Resource          _keywords.txt

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
go to session room - doctor
    [Tags]    video
    LoginDocKW
    Wait Until Element Is Visible    id:m_aside_left_offcanvas_toggle
    Click Element    id:m_aside_left_offcanvas_toggle
    Click Element    xpath://span[contains(text(),'My appointments')]
    Click Element    xpath://a[contains(text(),'Confirmed')]
    Click Element    xpath://tr[1]//td[2]//a[1]
    Click Element    xpath://a[@class='btn btn-success']

go to session room - patient
    [Tags]    video
    [Setup]    Open Chrome With Preferences
    LoginKW
    #Wait Until Element Is Visible    xpath://div[@class='toast-message']
    #Click Element    xpath://div[@class='toast-message']
    Sleep    1
    Wait Until Element Is Visible    id:m_aside_left_offcanvas_toggle
    Click Element    id:m_aside_left_offcanvas_toggle
    Click Element    xpath://span[contains(text(),'My appointments')]
    Wait Until Element Is Visible    id:appointmentTable_wrapper
    Click Element    xpath://a[contains(text(),'Confirmed')]
    Click Element    xpath://tr[1]//td[2]//a[1]
    Click Element    xpath://a[@class='btn btn-success']
    Sleep    5
    Input Text    xpath://input[@id='input-text-chat']    I am test patient and this is my text
    Sleep    5
    Click Element    xpath://button[@id='btn-chat']
    [Teardown]

doctor response chat msg
    Switch Browser    1
    Sleep    5
    Input Text    xpath://input[@id='input-text-chat']    I am test patient and this is my text
    Sleep    5
    Click Element    xpath://button[@id='btn-chat']
    Sleep    5
    LogoutKW

Close Video Session
    Switch Browser    2
    LogoutKW
    [Teardown]    Close Browser

*** Keywords ***
Chrome With Preferences
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --use-fake-ui-for-media-stream
    Call Method    ${chrome_options}    add_argument    --use-fake-device-for-media-stream
    Create Webdriver    Chrome    alias=tab1    chrome_options=${chrome_options}

Open Chrome Browser
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}

Open Chrome With Preferences
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --no-sandbox --use-fake-ui-for-media-stream --use-fake-device-for-media-stream
    #Call Method    ${options}    add_argument    --use-fake-device-for-media-stream
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}

Open Testbrowser
    ${system}=    Evaluate    platform.system()    platform
    Run Keyword If    '${system}' == 'Linux'    Start Virtual Display    1920    1080
    Open Chrome Browser
