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
Login
    UFJLogin
    Login Business KW
    Sleep    5

Post-job
    Sleep    5
    Wait Until Element Is Visible    xpath=//a[@id='postAjobBtn']
    Click Element    xpath=//a[@id='postAjobBtn']
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Start a contest?')]
    Click Element    xpath=//p[contains(text(),'Start a contest?')]
    Wait Until Element Is Visible    xpath=//form[1]/div[3]/div[1]/div[1]/div[1]/img[1]
    Click Element    xpath=//form[1]/div[3]/div[1]/div[1]/div[1]/img[1]
    Wait Until Element Is Enabled    id=jobTitle
    Clear Element Text    id=jobTitle
    ${number_title}=    Generate Random String    1    [NUMBERS]
    ${random_title}=    Generate Random String    1    [LETTERS]
    Element Should Be Visible    id=jobTitle
    Element Should Be Enabled    id=jobTitle
    Input Text    id=jobTitle    - \ No: ${number_title} need logo design for my company
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Enabled    id=jobDescription
    Input Text    id=jobDescription    Hi, BidFortune is company operating in the gov-tech space, and targeting US market. \ We are aiming at writing 1000-1200 word content pieces(regarding the contracting business) and looking to hire content writers for the same. \ Some of the competitors we have are: GovTribe, Federal Compass, Daltek Govwin - whose existing content we use for inspiration also. You might also want to check them, in case you are interested in working with us. \ We can start work, as soon as you want.
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Continue to Terms & Price')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'Continue to Terms & Price')]
    Click Element    xpath=//button[contains(text(),'Continue to Terms & Price')]
    Capture Page Screenshot    post-a-job-{index}.png

Terms & Prices
    ${number_title}=    Generate Random String    1    [NUMBERS]
    Wait Until Element Is Visible    xpath=//button[contains(text(),'1 Day')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'1 Day')]
    Capture Page Screenshot    post-a-job-{index}.png
    Clear Element Text    name=numberOfDays
    Sleep    1
    Click Element    name=numberOfDays
    Input Text    name=numberOfDays    1${number_title}
    #Click Element    xpath=//button[contains(text(),'1 Day')]
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Enabled    name=prize
    Input Text    name=prize    1${number_title}
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Continue to Preview')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'Continue to Preview')]
    Click Element    xpath=//button[contains(text(),'Continue to Preview')]
    Capture Page Screenshot    post-a-job-{index}.png

Preview
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Contest')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'Contest')]
    Click Element    xpath=//button[contains(text(),'Contest')]
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Successfully Posted Job')]
    Element Text Should Be    xpath=//div[contains(text(),'Successfully Posted Job')]    Successfully Posted Job
    Capture Element Screenshot    xpath=//div[contains(text(),'Successfully Posted Job')]
    Click Element    xpath=//div[contains(text(),'Successfully Posted Job')]

Single-job-post
    Wait Until Element Is Visible    class=SingleJobPostDetail_nextStep__32meF
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Request to sign NDA')]
    Click Element    xpath=//h2[contains(text(),'Request to sign NDA')]
    Click Element    xpath=//div[1]/div[1]/div[5]/div[3]/button[1]
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Proceed')]
    Click Element    xpath=//button[contains(text(),'Proceed')]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Upgrade Successfully')]
    Element Text Should Be    xpath=//div[contains(text(),'Upgrade Successfully')]    Upgrade Successfully
    Capture Element Screenshot    xpath=//div[contains(text(),'Upgrade Successfully')]

Notifications
    Wait Until Element Is Visible    id=notifications
    Click Element    id=notifications
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Read all')]
    Capture Page Screenshot    post-a-job-{index}.png
    #Wait Until Element Is Visible    xpath=//section[1]/div[2]/div[3]/div[2]
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Read all')]
    Click Element    xpath=//button[contains(text(),'Read all')]
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Not Visible    xpath=//button[contains(text(),'Read all')]
    Capture Page Screenshot    post-a-job-{index}.png

My-jobs
    Wait Until Element Is Visible    id=myJobs
    Click Element    id=myJobs
    Capture Page Screenshot    post-a-job-{index}.png
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Home')]
    Click Element    xpath=//a[contains(text(),'Home')]
    #transaction-histoy
    Wait Until Element Is Visible    xpath=//h4[contains(text(),'Finance')]
    Click Element    xpath=//h4[contains(text(),'Finance')]
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Transaction History')]
    Click Element    xpath=//a[contains(text(),'Transaction History')]
    Sleep    2
    Wait Until Element Is Visible    xpath=//tbody/tr[1]/td[1]
    Capture Page Screenshot    Transaction-History-{index}.png
    LogoutKW
