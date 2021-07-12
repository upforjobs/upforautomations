*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          _keywords.txt
Resource          _mysetup.txt
Library           String

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login to the website
    [Tags]    content.writing.contest
    UFJLogin

Required fields
    [Documentation]    In this test, we are testing alert messages for * Required input fields
    ...    - Title * Required
    ...    - Prize * Required
    ...    - Days * Minimum of 1 day required
    ...    - Description * Required
    [Tags]    content.writing.contest
    Content Writing Contest card KW
    Click Element    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Wait Until Element Is Visible    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]
    Element Should Be Visible    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]
    Element Text Should Be    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]    Required
    Wait Until Element Is Visible    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]
    Element Should Be Visible    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]
    Element Text Should Be    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]    Required
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Minimum of 1 day required')]
    Element Should Be Visible    xpath=//div[contains(text(),'Minimum of 1 day required')]
    Element Text Should Be    xpath=//div[contains(text(),'Minimum of 1 day required')]    Minimum of 1 day required
    Wait Until Element Is Visible    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[8]
    Element Should Be Visible    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[8]
    Element Text Should Be    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[8]    Required
    Scroll Element Into View    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-

Title
    [Documentation]    In this negative test scenario, we are testing edge case for minimum and maximum letters in the Title input filed triggering alert message using Random String
    ...    - ${minimumrandomtitle}
    ...    - ${maximumrandomtitle}
    ...    - input random 9 letters in the input filed
    ...    an alert message with the text should be "Too Short"
    ...    - input random 201 characters in the input filed
    ...    an alert message with the text should be "Too Long" \ \ \ \ \
    [Tags]    content.writing.contest
    Wait Until Element Is Enabled    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/input[1]
    Element Should Be Visible    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/input[1]
    Element Should Be Enabled    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/input[1]
    ${minimumrandomtitle} =    Generate Random String    9    [LETTERS]
    Input Text    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/input[1]    ${minimumrandomtitle}
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Too Short')]
    Element Should Be Visible    xpath=//div[contains(text(),'Too Short')]
    Element Text Should Be    xpath=//div[contains(text(),'Too Short')]    Too Short
    Scroll Element Into View    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Capture Element Screenshot    xpath=//div[contains(text(),'Too Short')]
    Go To    ${TESTURL}
    Content Writing Contest card KW
    ${maximumrandomtitle} =    Generate Random String    201    [LETTERS]
    Input Text    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/input[1]    ${maximumrandomtitle}
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Too Long')]
    Element Should Be Visible    xpath=//div[contains(text(),'Too Long')]
    Element Text Should Be    xpath=//div[contains(text(),'Too Long')]    Too Long
    Scroll Element Into View    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Capture Element Screenshot    xpath=//div[contains(text(),'Too Long')]
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-

Prize
    [Documentation]    In this test, we are test minimum and maximum characters in the input field for the Prize
    ...    - Input 9 in the input filed Prize should trigger an alert message with the text \ "Minimum prize is $10.00"
    ...    - Input 10001 in the input filed Prize should trigger an alert message with the text "The prize cannot be greater than $10000.00"
    [Tags]    content.writing.contest
    Input Text    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[3]/input[1]    1
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Minimum prize is $10.00')]
    Element Should Be Visible    xpath=//div[contains(text(),'Minimum prize is $10.00')]
    Element Text Should Be    xpath=//div[contains(text(),'Minimum prize is $10.00')]    Minimum prize is $10.00
    Scroll Element Into View    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-
    Clear Element Text    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[3]/input[1]
    Input Text    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[3]/input[1]    10001
    Wait Until Element Is Visible    xpath=//div[contains(text(),'The prize cannot be greater than $10000.00')]
    Element Should Be Visible    xpath=//div[contains(text(),'The prize cannot be greater than $10000.00')]
    Element Text Should Be    xpath=//div[contains(text(),'The prize cannot be greater than $10000.00')]    The prize cannot be greater than $10000.00
    Scroll Element Into View    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-

Days
    [Documentation]    I this test we are testin maximum numers of days for the Days input field
    ...    - input 31 in to the input filed days should trigger an alert message with the text "Maximum of 30 days"
    [Tags]    content.writing.contest
    Input Text    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[5]/input[1]    31
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Maximum of 30 days')]
    Element Should Be Visible    xpath=//div[contains(text(),'Maximum of 30 days')]
    Element Text Should Be    xpath=//div[contains(text(),'Maximum of 30 days')]    Maximum of 30 days
    Scroll Element Into View    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-

Description
    [Documentation]    in this test, we are test minimum and maximum characters in the input field for the description
    ...    - Input 49 characters in the text area Description it should trigger an alert message with the text "Too Short"
    ...    - Input 2001 characters in the text area Description it should trigger alert message with the text "Too Long"
    [Tags]    content.writing.contest
    #contest
    Wait Until Element Is Visible    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[7]/textarea[1]
    Element Should Be Enabled    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[7]/textarea[1]
    ${minimumdescription} =    Generate Random String    49    [LETTERS]
    Input Text    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[7]/textarea[1]    ${minimumdescription}
    Element Should Be Visible    xpath=//div[contains(text(),'Too Short')]
    Element Text Should Be    xpath=//div[contains(text(),'Too Short')]    Too Short
    Scroll Element Into View    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-
    Go To    ${TESTURL}
    Content Writing Contest card KW
    Wait Until Element Is Visible    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]/textarea[1]
    ${maximumdescription} =    Generate Random String    2000    [LETTERS]
    Input Text    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]/textarea[1]    ${maximumdescription}
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Too Long')]
    Element Should Be Enabled    xpath=//div[contains(text(),'Too Long')]
    Element Text Should Be    xpath=//div[contains(text(),'Too Long')]    Too Long
    Scroll Element Into View    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-

Post a One Click Contest Builder
    [Documentation]    This is the positive test case scenario when user wants to post a Content Writing Contest
    ...    - asserting and verifying element on the Content Writing Contest card text and input fileds and button.
    ...    - expected behavior is the user should be redirected to Preview job Page
    ...    - this need to be fixed https://upforjobs.atlassian.net/browse/MU-876
    Go To    ${TESTURL}
    Content Writing Contest card KW
    ${minimumrandomtitle} =    Generate Random String    5    [NUMBERS]
    Input Text    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/input[1]    Generate Content Writing Contest No: ${minimumrandomtitle}
    Input Text    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]/input[1]    10
    Input Text    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[3]/input[1]    3
    Input Text    xpath=//body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]/textarea[1]    ${description}
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-
    Click Element    xpath=//section[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Sleep    2
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Pay $10.00 & Publish')]
    #- this need to be fixed https://upforjobs.atlassian.net/browse/MU-876
