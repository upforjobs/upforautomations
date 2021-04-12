*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 SeleniumLibrary
Library                 String
Library                 XvfbRobot

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          class=Login_headingText__2QdrP
          Input Text          id=emailOrUserName          ufj
          Input Text          id=password          ${ufjpass}
          Submit Form
          Login Business KW

Post a job page
          Navheader Business
          Wait Until Element Is Visible          id=postAJob
          Click Element          id=postAJob
          Breadcrumb post a job

Job Description
          [Documentation]          Add Title and Description
          Job Description page
          ${letter}          Generate Random String          1          [LETTERS]
          ${letter1}          Generate Random String          1          [LETTERS]
          ${letter2}          Generate Random String          1          [LETTERS]
          Sleep          3
          Scroll Element Into View          xpath=//p[contains(text(),'Start a contest?')]
          Click Element          xpath=//p[contains(text(),'Start a contest?')]
          Capture Page Screenshot          title-{index}.png
          Wait Until Element Is Visible          id=category
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
          Press Keys          id=skills          RETURN
          Sleep          1
          ${number_title}=          Generate Random String          5          [NUMBERS]
          ${random_title}=          Generate Random String          2          [LETTERS]
          Element Should Be Visible          id=jobTitle
          Element Should Be Enabled          id=jobTitle
          Input Text          id=jobTitle          No: ${number_title} Contest with IP agreement Testing
          Capture Page Screenshot          title-{index}.png
          Element Should Be Visible          id=jobDescription
          Element Should Be Enabled          id=jobDescription
          ${random_description}=          Generate Random String          20          [LETTERS]
          Input Text          id=jobDescription          My page is based on scientific and belief announcements or publicationsy ${number_title} ${random_title} ${description}
          Capture Page Screenshot          title-{index}.png
          Sleep          1
          ${id} =          Generate Random String          2          [NUMBERS]
          Element Should Be Enabled          id=upload
          Choose File          id=upload          ${CURDIR}\\random\\${id}.jpg
          Capture Page Screenshot          uploaded-file-{index}.png
          Click Element          xpath=//button[contains(text(),'Continue to Terms & Price')]
          Capture Page Screenshot          uploaded-file-{index}.png

Terms and Prices
          #Terms & Prices
          Terms & Prices Contest page
          Clear Element Text          name=numberOfDays
          Input Text          name=numberOfDays          30
          ${prize}=          Generate Random String          1          [NUMBERS]
          Input Text          name=prize          1${prize}
          Capture Page Screenshot          post-a-contest-{index}.png
          Click Element          xpath=//button[contains(text(),'Continue to Preview')]

Preview
          #review
          #Preview page
          ${alert} =          Get Text          class=JobForm_postJobPreview__3Lqld
          Log To Console          ${alert}
          Wait Until Element Is Visible          xpath=//h3[contains(text(),'Optional Upgrades')]
          ${alert1} =          Get Text          class=JobForm_optionalUpgrades__2B8zy
          Log To Console          ${alert1}
          #NDA Agreemenet
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Ip Agreement Power Boost')]
          Click Element          xpath=//h2[contains(text(),'Ip Agreement Power Boost')]
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Contest')]
          Click Element          xpath=//button[contains(text(),'Contest')]
          Capture Page Screenshot          preview-contest{index}.png
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Successfully Posted Job')]
          Capture Element Screenshot          xpath=//div[contains(text(),'Successfully Posted Job')]
          Click Element          xpath=//div[contains(text(),'Successfully Posted Job')]

Transaction
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Details')]
          Element Should Be Visible          xpath=//div[contains(text(),'Details')]
          Element Text Should Be          xpath=//div[contains(text(),'Details')]          Details
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Submissions')]
          Element Should Be Visible          xpath=//div[contains(text(),'Submissions')]
          Element Text Should Be          xpath=//div[contains(text(),'Submissions')]          Submissions
          Capture Page Screenshot          single-job-page-contest{index}.png
          Wait Until Element Is Visible          id=myJobs
          Element Should Be Visible          id=myJobs
          Element Should Be Enabled          id=myJobs
          Click Element          id=myJobs
          Wait Until Element Is Visible          xpath=//a[contains(text(),'All Jobs')]
          Element Should Be Visible          xpath=//a[contains(text(),'All Jobs')]
          Element Should Be Enabled          xpath=//a[contains(text(),'All Jobs')]
          Element Text Should Be          xpath=//a[contains(text(),'All Jobs')]          All Jobs
          Wait Until Element Is Visible          xpath=//section[1]/div[3]/div[2]/div[1]/div[2]
          Element Should Be Visible          xpath=//section[1]/div[3]/div[2]/div[1]/div[2]
          Element Should Be Enabled          xpath=//section[1]/div[3]/div[2]/div[1]/div[2]
          Capture Page Screenshot          My-jobs-{index}.png
          #notification
          Wait Until Element Is Visible          id=notifications
          Element Should Be Visible          id=notifications
          Element Should Be Enabled          xpath=//a[@id='notifications']
          Click Element          xpath=//a[@id='notifications']
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Notifications')]
          Capture Page Screenshot          notification-{index}.png
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Read all')]
          Wait Until Element Is Enabled          xpath=//button[contains(text(),'Read all')]
          Click Element          xpath=//button[contains(text(),'Read all')]
          Capture Page Screenshot          read-all-{index}.png

Contest single job page
          Wait Until Element Is Visible          css=.Nav_profileImg__u9k60:nth-child(6) > .Avatar_avatar__container__6SBhX
          Wait Until Element Is Visible          css=.Nav_profileImg__u9k60:nth-child(6) > .Avatar_avatar__container__6SBhX
          Element Should Be Enabled          css=.Nav_profileImg__u9k60:nth-child(6) > .Avatar_avatar__container__6SBhX
          Click Element          css=.Nav_profileImg__u9k60:nth-child(6) > .Avatar_avatar__container__6SBhX
          Capture Page Screenshot          avatar-{index}.png
          Wait Until Element Is Visible          css=#manageFinances
          Element Should Be Visible          xpath=//a[@id='manageFinances']
          Element Should Be Enabled          xpath=//a[@id='manageFinances']
          Click Element          xpath=//a[@id='manageFinances']
          Capture Page Screenshot          menu-{index}.png
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Transaction History')]
          Element Should Be Visible          xpath=//a[contains(text(),'Transaction History')]
          Element Should Be Enabled          xpath=//a[contains(text(),'Transaction History')]
          Click Element          xpath=//a[contains(text(),'Transaction History')]
          Capture Page Screenshot          transaction-history-{index}.png
          Log To Console          class=table-responsive

Logout
          LogoutKW
