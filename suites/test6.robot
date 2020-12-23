*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           XvfbRobot
Resource          _mysetup.txt
Resource          _keywords.txt
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Patient make 3 withdraw request
    [Documentation]    1st should be canceled from patient
    ...    -
    ...    2nd should be canceled from admin
    ...    -
    ...    3rd should be approved from admin
    [Tags]    withdrawal.requests
    Click Button    xpath://button[@class='send-modal btn btn-primary']
    Patient Withdraw Request modal
    Wait Until Element Is Visible    id:amount
    ${withdraw} =    Generate Random String    prelounch    [NUMBERS]
    Input Text    id:amount    1${withdraw}
    Capture Page Screenshot    first-request-{index}.png
    Click Button    xpath://button[@class='btn actionBtn btn-primary runAjaxSend']
    Wait Until Element Is Visible    xpath://button[@class='send-modal btn btn-primary']
    Sleep    3
    Click Button    xpath://button[@class='send-modal btn btn-primary']
    Patient Withdraw Request modal
    Wait Until Element Is Visible    id:amount
    Input Text    id:amount    1${withdraw}
    Capture Page Screenshot    second-request-{index}.png
    Click Button    //button[@class='btn actionBtn btn-primary runAjaxSend']
    Wait Until Element Is Visible    //button[@class='send-modal btn btn-primary']
    Sleep    3
    Click Button    //button[@class='send-modal btn btn-primary']
    Patient Withdraw Request modal
    Wait Until Element Is Visible    id:amount
    Input Text    id:amount    1${withdraw}
    Capture Page Screenshot    third-request-{index}.png
    Click Button    //button[@class='btn actionBtn btn-primary runAjaxSend']
    Sleep    3

*** Keywords ***
