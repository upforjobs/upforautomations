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
Login to webiste
    UFJLogin

Post a OCCB 3days
    [Tags]    content.writing.contest
    Sleep    5
    Login Business KW
    Sleep    5
    Navheader Business
    Wait Until Element Is Visible    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Scroll Element Into View    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    ${minimumrandomtitle} =    Generate Random String    5    [NUMBERS]
    Input Text    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/input[1]    Generated Content Writing Contest No: ${minimumrandomtitle}
    Input Text    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]/input[1]    10
    Input Text    name=numberOfDays    3
    Input Text    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]/textarea[1]    ${description}
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-
    Wait Until Element Is Visible    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Click Element    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Sleep    5
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Pay $10.00 & Publish')]
    Sleep    10
    ${amount} =    Get Text    class=JobLayoutLeft_priceContainer__1m5WV
    Log To Console    ${amount}
    ${ChosenElements} =    Get Text    class=ContestDetail_chosenElements__3ZUil
    Log To Console    ${ChosenElements}
    ${ContestDuration} =    Get Text    class=ContestDetail_elements__2hmj2
    Log To Console    ${ContestDuration}
    Scroll Element Into View    xpath=//button[contains(text(),'Pay $10.00 & Publish')]
    Sleep    5
    Click Element    xpath=//button[contains(text(),'Pay $10.00 & Publish')]
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Element Should Be Visible    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Element Should Be Enabled    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Capture Element Screenshot    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    ${alert-success} =    Get Text    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Log To Console    ${alert-success}
    Click Element    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Capture Page Screenshot    contest-3-days-{index}.png
    Go to the Notification KW
    Go to the My Jobs KW
    #Click Element    xpath=//section[1]/div[3]/div[2]/div[1]/div[2]/div[2]/a[1]
    #Wait Until Element Is Visible    class=ContestDetail_contestDetail__2XT5A
    #Wait Until Element Is Visible    class=AvailableFeatureBoosts_featureBoost__1YPPk
    #Wait Until Element Is Visible    class=Wait Until Element Is Visible
    Click Element    class=logo

Post a OCCB 2 days
    Navheader Business
    Wait Until Element Is Visible    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Scroll Element Into View    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    ${minimumrandomtitle} =    Generate Random String    5    [NUMBERS]
    Input Text    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/input[1]    Generated Content Writing Contest No: ${minimumrandomtitle}
    Input Text    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]/input[1]    10
    Input Text    name=numberOfDays    2
    Input Text    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]/textarea[1]    ${description}
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-
    Capture Page Screenshot    preview-job-page-{index}.png
    Wait Until Element Is Visible    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Click Element    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Sleep    10
    ${amount} =    Get Text    class=JobLayoutLeft_priceContainer__1m5WV
    Log To Console    ${amount}
    ${ChosenElements} =    Get Text    class=ContestDetail_chosenElements__3ZUil
    Log To Console    ${ChosenElements}
    ${ContestDuration} =    Get Text    class=ContestDetail_elements__2hmj2
    Log To Console    ${ContestDuration}
    ${totalPrize} =    Get Text    class=AvailableFeatureBoosts_featureBoostPrize__1hLaK
    Log To Console    ${totalPrize}
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Pay $39.99 & Publish')]
    Scroll Element Into View    xpath=//button[contains(text(),'Pay $39.99 & Publish')]
    Sleep    5
    Click Element    xpath=//button[contains(text(),'Pay $39.99 & Publish')]
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Element Should Be Visible    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Element Should Be Enabled    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Capture Element Screenshot    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    ${alert-success} =    Get Text    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Log To Console    ${alert-success}
    Click Element    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Capture Page Screenshot    contest-2-days-{index}.png
    Go to the Notification KW
    Go to the My Jobs KW
    Click Element    class=logo

Post a OCCB 1 day
    Navheader Business
    Wait Until Element Is Visible    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Scroll Element Into View    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    ${minimumrandomtitle} =    Generate Random String    5    [NUMBERS]
    Input Text    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/input[1]    Generated Content Writing Contest No: ${minimumrandomtitle}
    Input Text    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]/input[1]    10
    Input Text    name=numberOfDays    1
    Input Text    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]/textarea[1]    ${description}
    Capture Element Screenshot    class=OneClickContestCard_oneClickContestCardInfo__s_MY-
    Capture Page Screenshot    preview-job-page-{index}.png
    Wait Until Element Is Visible    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Click Element    xpath=//section[1]/section[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/button[1]
    Sleep    10
    ${amount} =    Get Text    class=JobLayoutLeft_priceContainer__1m5WV
    Log To Console    ${amount}
    ${ChosenElements} =    Get Text    class=ContestDetail_chosenElements__3ZUil
    Log To Console    ${ChosenElements}
    ${ContestDuration} =    Get Text    class=ContestDetail_elements__2hmj2
    Log To Console    ${ContestDuration}
    ${totalPrize} =    Get Text    class=AvailableFeatureBoosts_featureBoostPrize__1hLaK
    Log To Console    ${totalPrize}
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Pay $44.50 & Publish')]
    Scroll Element Into View    xpath=//button[contains(text(),'Pay $44.50 & Publish')]
    Sleep    5
    Click Element    xpath=//button[contains(text(),'Pay $44.50 & Publish')]
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Element Should Be Visible    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Element Should Be Enabled    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Capture Element Screenshot    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    ${alert-success} =    Get Text    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Log To Console    ${alert-success}
    Click Element    xpath=//p[contains(text(),'Your contest is posted successfully!')]
    Capture Page Screenshot    contest-2-days-{index}.png
    Go to the Notification KW
    Go to the My Jobs KW
    Click Element    class=logo
    LogoutKW
