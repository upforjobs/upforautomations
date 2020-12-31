*** Settings ***
Suite Setup       Open Testbrowser
Suite Teardown    Close All Browsers
Test Setup
Library           SeleniumLibrary
Library           String
Library           XvfbRobot
Resource          _mysetup.txt
Resource          _keywords.txt
Library           Collections

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login
    [Tags]
    Maximize Browser Window
    Go To    ${TESTURL}
    Click Element    xpath://button[contains(text(),'Login')]
    Login modal dialog
    Input Text    name:username    ${user1}
    Input Text    name:password    ${password}
    Click Element    id:login
    #Wait Until Element Is Not Visible    xpath://button[contains(text(),'Login')]
    Wait Until Element Is Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[2]
    Capture Page Screenshot    miniDashboard-{index}.png

Post a Job
    [Tags]
    Wait Until Element Is Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[1]
    #mini-dashboard
    mini-dashboard
    #post a job button
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[2]/div[3]/a[1]
    Element Text Should Be    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[1]/div[2]/div[3]/a[1]    Post a Job
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[2]/h2[1]
    Element Text Should Be    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[2]/h2[1]    Up Rated Freelancers
    Element Should Be Visible    xpath://p[contains(text(),'Hire the Best of Up For Jobs.')]
    Element Text Should Be    xpath://p[contains(text(),'Hire the Best of Up For Jobs.')]    Hire the Best of Up For Jobs.
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[2]/a[1]
    Element Text Should Be    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[2]/a[1]    View All
    #social impact
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[3]
    Element Text Should Be    xpath://h2[contains(text(),'Make Social Impact!')]    Make Social Impact!
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[3]/p[1]
    Scroll Element Into View    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[3]/p[1]
    ${social} =    Get Text    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[3]/p[1]
    Log to console    ${social}
    Capture Page Screenshot    social-impact-{index}.png
    #Rcomended users
    Element Text Should Be    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[4]/h2[1]    Recommended Freelancers
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[4]/div[1]
    Capture Page Screenshot    RecommendedFreelancers-{index}.png
    Element Text Should Be    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/div[4]/a[1]    View All
    #Success path
    Element Should Be Visible    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/section[1]/div[1]
    Element Text Should Be    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/section[1]/div[1]/div[1]/h2[1]    Success Path
    Element Text Should Be    xpath://p[contains(text(),'We guide freelancers to success via:')]    We guide freelancers to success via:
    Element Text Should Be    xpath://h3[contains(text(),'Up For Success')]    Up For Success
    Element Text Should Be    xpath://body/div[@id='root']/div[1]/section[1]/section[1]/section[1]/div[1]/div[2]/div[1]/a[1]    blog
    Element Text Should Be    xpath://h3[contains(text(),'Up For Vids')]    Up For Vids
    Element Text Should Be    xpath://a[contains(text(),'videoblog')]    videoblog
    Element Text Should Be    xpath://h3[contains(text(),'Up For Teams')]    Up For Teams
    Element Text Should Be    xpath://a[contains(text(),'team creator app')]    team creator app

user login test - failure
    [Documentation]    user login test - failure - wrong pass
    [Tags]

user login test - success
    [Tags]

user logout - success
    [Tags]

user access my appointments
    [Tags]
    [Teardown]

inactive and delete patient
    [Tags]

*** Keywords ***
Open Chrome Browser
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
