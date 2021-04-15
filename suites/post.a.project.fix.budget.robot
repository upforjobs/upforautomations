*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Resource                _mysetup.txt
Resource                _keywords.txt
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
          #mini-dashboard
          #post a job button
          #Click Element          clas=#postAJob
          Navheader Business
          Wait Until Element Is Visible          id=postAJob
          Click Element          id=postAJob
          Breadcrumb post a job
          #Describe and attach section

Job Description
          [Documentation]          Add Title and Description
          Job Description page
          ${letter}          Generate Random String          1          [LETTERS]
          ${letter1}          Generate Random String          1          [LETTERS]
          ${letter2}          Generate Random String          1          [LETTERS]
          Sleep          3
          Scroll Element Into View          xpath=//p[contains(text(),'Post a project?')]
          Click Element          xpath=//p[contains(text(),'Post a project?')]
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
          Input Text          id=jobTitle          No: ${number_title} Testing Project Fixed rate ${random_title}
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
          Click Element          xpath=//button[contains(text(),'Continue to Terms & Price')]
          Capture Page Screenshot          uploaded-file-{index}.png

Terms and Prices
          #Terms & Prices
          Terms & Prices Project page
          Wait Until Element Is Enabled          id=location
          ${letter} =          Generate Random String          1          [LETTERS]
          Input Text          xpath=//form[1]/div[2]/div[1]/div[1]/div[1]/div[1]/input[1]          ${letter}
          Click Element          class=MultipleSelectOption_multipleSelectOption__2gwIa \
          #Click Element          xpath=//div[contains(text(),'Worldwide')]
          Click Element          xpath=//p[contains(text(),'Project Type')]
          Element Should Be Visible          xpath=//div[contains(text(),'One-time Project')]
          Element Should Be Visible          xpath=//div[contains(text(),'Ongoing Project')]
          Click Element          xpath=//div[contains(text(),'One-time Project')]
          ${numboffreelancers} =          Generate Random String          1          [NUMBERS]
          Input Text          id=numberOfFreelancers          1${numboffreelancers}
          Click Element          xpath=//p[contains(text(),'Experience Level')]
          Element Should Be Visible          xpath=//div[contains(text(),'Entry Level')]
          Element Should Be Visible          xpath=//div[contains(text(),'Intermediate')]
          Element Should Be Visible          xpath=//div[contains(text(),'Expert')]
          Click Element          xpath=//div[contains(text(),'Entry Level')]
          Click Element          xpath=//p[contains(text(),'Expected Time')]
          Element Should Be Visible          //div[contains(text(),'Less than 20 hrs/week')]
          Element Should Be Visible          //div[contains(text(),'More than 20 hrs/week')]
          Element Should Be Visible          xpath=//div[contains(text(),'Still to be determined')]
          Element Should Be Visible          xpath=//div[contains(text(),'Full time')]
          Click Element          xpath=//div[contains(text(),'Still to be determined')]
          Click Element          xpath=//p[contains(text(),'Project Length')]
          Element Should Be Visible          xpath=//div[contains(text(),'Less than a month')]
          Element Should Be Visible          xpath=//div[contains(text(),'Less than 3 months')]
          Element Should Be Visible          xpath=//div[contains(text(),'Less than 3 months')]
          Sleep          3
          Click Element          id=FIXED
          Element Should Be Visible          name=fixedRate
          Element Should Be Enabled          name=fixedRate
          ${budget}=          Generate Random String          2          [NUMBERS]
          Input Text          name=fixedRate          ${budget}
          Capture Page Screenshot          post-a-contest-{index}.png
          Click Element          xpath=//button[contains(text(),'Continue to Preview')]

Preview
          #review
          #Preview page
          ${url} =          Get Location
          Log to console          ${url}
          ${jobinfo} =          Get Text          class=JobForm_postJobPreview__3Lqld
          Log To Console          ${jobinfo}
          Wait Until Element Is Visible          xpath=//h3[contains(text(),'Optional Upgrades')]
          #${OptUp} =          Get Text          class=JobForm_optionalUpgrades__2B8zy
          #Log To Console          ${OptUp}
          Wait Until Element Is Visible          xpath=//h3[contains(text(),'Optional Upgrades')]
          Click Element          xpath=//button[contains(text(),'Project')]
          Capture Page Screenshot          preview-contest{index}.png
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Successfully Posted Job')]
          Capture Element Screenshot          xpath=//div[contains(text(),'Successfully Posted Job')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'Successfully Posted Job')]
          Log To Console          ${alert}
          Click Element          xpath=//div[contains(text(),'Successfully Posted Job')]

Transaction
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Details')]
          Element Should Be Visible          xpath=//div[contains(text(),'Details')]
          Element Text Should Be          xpath=//div[contains(text(),'Details')]          Details
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Proposals')]
          Element Should Be Visible          xpath=//div[contains(text(),'Proposals')]
          Element Text Should Be          xpath=//div[contains(text(),'Proposals')]          Proposals
          ${data} =          Get Text          xpath=//section[1]/div[1]/div[1]/div[2]
          Log To Console          ${data}
          Capture Page Screenshot          single-job-page-project{index}.png
          Wait Until Element Is Visible          id=myJobs
          Element Should Be Visible          id=myJobs
          Element Should Be Enabled          id=myJobs
          Click Element          id=myJobs
          Wait Until Element Is Visible          xpath=//a[contains(text(),'All Jobs')]
          Element Should Be Visible          xpath=//a[contains(text(),'All Jobs')]
          Element Should Be Enabled          xpath=//a[contains(text(),'All Jobs')]
          Element Text Should Be          xpath=//a[contains(text(),'All Jobs')]          All Jobs
          Wait Until Element Is Visible          xpath=//section[1]/div[3]/div[2]/div[1]/div[2]
          ${data} =          Get Text          xpath=//section[1]/div[3]/div[2]/div[1]/div[2]
          Log To Console          ${data}
          Capture Page Screenshot          My-jobs-{index}.png

Project single job page
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
          ${data} =          Get Text          xpath=//div[1]/div[1]/div[2]/div[1]/div[2]
          Log To Console          ${data}
          Capture Page Screenshot          My-jobs-{index}.png

Logout
          LogoutKW

*** Keywords ***
Open Chrome Browser
          ${options}          Evaluate          sys.modules['selenium.webdriver'].ChromeOptions()          sys, selenium.webdriver
          Call Method          ${options}          add_argument          --no-sandbox
          ${prefs}          Create Dictionary          download.default_directory=${TMP_PATH}
          Call Method          ${options}          add_experimental_option          prefs          ${prefs}
          Create Webdriver          Chrome          chrome_options=${options}
