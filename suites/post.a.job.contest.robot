*** Settings ***
Documentation           in this test we are testing Login form
...                     Landing page
...                     post a job page
...                     my jobs page
...                     transaction page with paypal
...                     logout
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Test Setup
Library                 SeleniumLibrary
Library                 String
Library                 XvfbRobot
Resource                _mysetup.txt
Resource                _keywords.txt
Library                 Collections

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login
          Login Business KW

Post a job page
          #mini-dashboard
          #post a job button
          #Click Element          clas=#postAJob
          mini-dashboard
          Click Element          css=#postAJob
          Breadcrumb post a job
          Post a job header
          Describe and attach section
          Select Category and Skills section
          Select Job Type section

Describe
          [Documentation]          Add Title and Description
          Scroll Element Into View          xpath=//h2[contains(text(),'Post a project?')]
          Capture Page Screenshot          title-{index}.png
          ${number_title}=          Generate Random String          5          [NUMBERS]
          ${random_title}=          Generate Random String          2          [LETTERS]
          Element Should Be Visible          id=jobTitle
          Element Should Be Enabled          id=jobTitle
          Input Text          id=jobTitle          No: ${number_title} Testing Contest ${random_title}
          Capture Page Screenshot          title-{index}.png
          Element Should Be Visible          id=jobDescription
          Element Should Be Enabled          id=jobDescription
          ${random_description}=          Generate Random String          20          [LETTERS]
          Input Text          id=jobDescription          My page is based on scientific and belief announcements or publicationsy${number_title} ${random_title} ${description}
          Capture Page Screenshot          title-{index}.png
          Sleep          1
          ${id} =          Generate Random String          2          [NUMBERS]
          Element Should Be Enabled          id=upload
          Choose File          id=upload          ${CURDIR}\\random\\${id}.jpg
          Capture Page Screenshot          uploaded-file-{index}.png

Select Category and Skills
          ${letter}          Generate Random String          1          [LETTERS]
          ${letter1}          Generate Random String          1          [LETTERS]
          ${letter2}          Generate Random String          1          [LETTERS]
          Wait Until Element Is Visible          id=category
          Scroll Element Into View          xpath=//h3[contains(text(),'Select Job Type')]
          Element Should Be Enabled          id=category
          Click Element          id=category
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Programming & Development')]
          Click Element          xpath=//div[contains(text(),'Programming & Development')]
          Capture Page Screenshot          category-{index}.png
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Sub Category')]
          Element Should Be Enabled          xpath=//p[contains(text(),'Sub Category')]
          Click Element          xpath=//p[contains(text(),'Sub Category')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Programming & Software')]
          Click Element          xpath=//div[contains(text(),'Programming & Software')]
          Capture Page Screenshot          sub-category-{index}.png
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Sub Category')]
          Element Should Be Enabled          xpath=//p[contains(text(),'Sub Category')]
          Click Element          xpath=//p[contains(text(),'Sub Category')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Web Development & Design')]
          Click Element          xpath=//div[contains(text(),'Web Development & Design')]
          Click Element          class=fa-times
          Capture Page Screenshot          sub-category-{index}.png
          Wait Until Element Is Visible          id=skills
          Element Should Be Enabled          id=skills
          Input Text          id=skills          ${letter}a${letter1}a${letter2}a
          Sleep          1
          Press Keys          id=skills          RETURN
          Sleep          3

Select Job Type
          #Select Job Type
          Scroll Element Into View          xpath=//h3[contains(text(),'Optional Upgrades')]
          #CONTEST
          Click Element          id=contest
          Scroll Element Into View          xpath=//h3[contains(text(),'Optional Upgrades')]
          Capture Page Screenshot          contest-{index}.png
          Wait Until Element Is Visible          xpath=//h3[contains(text(),'Number of Days')]
          Element Should Be Visible          xpath=//h3[contains(text(),'Number of Days')]
          Element Text Should Be          xpath=//h3[contains(text(),'Number of Days')]          Number of Days
          Wait Until Element Is Visible          xpath=//button[contains(text(),'1 Day')]
          Element Should Be Visible          xpath=//button[contains(text(),'1 Day')]
          Element Text Should Be          xpath=//button[contains(text(),'1 Day')]          1 Day
          Wait Until Element Is Visible          xpath=//button[contains(text(),'2 Days')]
          Element Should Be Visible          xpath=//button[contains(text(),'2 Days')]
          Element Text Should Be          xpath=//button[contains(text(),'2 Days')]          2 Days
          Wait Until Element Is Visible          name=numberOfDays
          Element Should Be Enabled          name=numberOfDays
          Wait Until Element Is Visible          xpath=//h3[contains(text(),'Select Prize Amount')]
          Element Should Be Visible          xpath=//h3[contains(text(),'Select Prize Amount')]
          Element Text Should Be          xpath=//h3[contains(text(),'Select Prize Amount')]          Select Prize Amount
          Wait Until Element Is Visible          name=prize
          Element Should Be Enabled          name=prize
          Wait Until Element Is Visible          xpath=//h3[contains(text(),'Optional Upgrades')]
          Element Should Be Visible          xpath=//h3[contains(text(),'Optional Upgrades')]
          Element Text Should Be          xpath=//h3[contains(text(),'Optional Upgrades')]          Optional Upgrades
          Log To Console          xpath=//div[@id='contest']
          Capture Page Screenshot          preview-contest-{index}.png
          Capture Element Screenshot          xpath=//div[@id='contest']
          ${prize}=          Generate Random String          3          [NUMBERS]
          Input Text          name=prize          ${prize}
          #Wait Until Element Is Visible          class=TriangleBadge_container__2Eed5          #Urgent
          Scroll Element Into View          xpath=//div[@id='contest']
          Capture Element Screenshot          xpath=//div[@id='contest']
          #Wait Until Element Is Visible          xpath=//button[contains(text(),'Login and Post')]
          #Element Should Be Enabled          xpath=//button[contains(text(),'Login and Post')]
          #Element Text Should Be          xpath=//button[contains(text(),'Login and Post')]          Post
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Contest')]
          Scroll Element Into View          xpath=//button[contains(text(),'Contest')]
          Click Element          xpath=//button[contains(text(),'Contest')]
          Capture Page Screenshot          post-a-contest-{index}.png

Transaction
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Payment Breakdown')]
          Capture Page Screenshot          slika-{index}.png
          Sleep          3
          Select Frame          xpath=//iframe[@id='jsx-iframe-7a76a45c7f']
          Sleep          15
          Wait Until Element Is Visible          xpath=//input[@id='email']
          Input Text          xpath=//input[@id='email']          zarko.paypal2020@gmail.com
          Capture Page Screenshot          slika-{index}.png
          Wait Until Element Is Visible          xpath=//input[@id='password']
          Input Text          xpath=//input[@id='password']          Tester##99
          Wait Until Element Is Visible          xpath=//button[@id='btnLogin']
          Click Element          xpath=//button[@id='btnLogin']
          Sleep          17
          Wait Until Element Is Visible          xpath=//span[contains(text(),'Hi Paypal,')]
          Capture Page Screenshot          slika-{index}.png
          Scroll Element Into View          css=#payment-submit-btn
          Click Element          css=#payment-submit-btn
          Capture Page Screenshot          slika-{index}.png
          Sleep          7
          #ALERT MESSAGES

Contest single job page
          Sleep          5
          Capture Page Screenshot          slika-{index}.png

My Jobs
          Navheader Business
          Click Element          id=myJobs
          Wait Until Element Is Visible          class=MyJobs_myJobsTable__ouUeb
          Wait Until Element Is Visible          class=MyJobsJobCard_myJobsCard__1S7w0
          Capture Element Screenshot          class=MyJobs_myJobsTable__ouUeb
          Capture Page Screenshot          my-jobs-{index}.png

Logout
          LogoutKW

*** Keywords ***
Open Chrome Browser
          ${options}          Evaluate          sys.modules['selenium.webdriver'].ChromeOptions()          sys, selenium.webdriver
          Call Method          ${options}          add_argument          --no-sandbox
          ${prefs}          Create Dictionary          download.default_directory=${TMP_PATH}
          Call Method          ${options}          add_experimental_option          prefs          ${prefs}
          Create Webdriver          Chrome          chrome_options=${options}
