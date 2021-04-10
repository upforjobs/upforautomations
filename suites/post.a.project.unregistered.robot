*** Settings ***
Documentation           Graphic and Logo design / Project
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 XvfbRobot
Library                 String

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Post a Job - 1st step
          [Documentation]          User go to post a job 1st step [tag] postajob
          ...          - add title
          ...          - add description
          [Tags]          postajob
          Maximize Browser Window
          Delete All Cookies
          Capture Page Screenshot          title-{index}.png
          Go To          ${TESTURL}/post-a-job/step-1
          ${url} =          Get Location
          Log to console          ${url}
          Header Post a Job
          Wait Until Element Is Visible          xpath://h2[contains(text(),'Describe & Attach files')]
          Element Text Should Be          xpath://h2[contains(text(),'Describe & Attach files')]          Describe & Attach files
          Click Element          class:PostAJobStep1_btnNext__29SID
          Capture Page Screenshot          postt-a-job/step-1-{index}.png
          Element Text Should Be          xpath://h2[contains(text(),'Describe & Attach files')]          Describe & Attach files
          ${number_title}          Generate Random String          5          [NUMBERS]
          ${random_title}          Generate Random String          5          [LETTERS]
          Input Text          id:title          No: ${number_title} Create and manage Project ${random_title}
          Capture Page Screenshot          title-{index}.png
          ${random_description}          Generate Random String          4800          [LETTERS]
          Input Text          id:description          Project with number ${number_title} ${random_title} ${description}
          Capture Page Screenshot          title-{index}.png
          Sleep          1
          #define button
          Click Element          xpath://button[@class="buttonBtn PostAJobStep1_btnNext__29SID"]

Post a Job - 2nd step
          [Documentation]          User go to post a job 2nd step [tag] postajob
          ...          - assert and verify elements on the page
          ...          - select category
          ...          - select sub-categoru
          ...          - add one skill
          ...          - go to the 3rd step
          [Tags]          postajob
          ${url} =          Get Location
          Log to console          ${url}
          Header Post a Job
          Wait Until Element Is Visible          xpath://h2[contains(text(),'Select category')]
          Element Text Should Be          xpath://h2[contains(text(),'Select category')]          Select category
          # 2nd step page
          Wait Until Element Is Visible          xpath://p[contains(text(),'Graphic & Design')]
          Element Text Should Be          xpath://p[contains(text(),'Graphic & Design')]          Graphic & Design
          Wait Until Element Is Visible          xpath://p[contains(text(),'Writing & Translation')]
          Element Text Should Be          xpath://p[contains(text(),'Writing & Translation')]          Writing & Translation
          Wait Until Element Is Visible          xpath://p[contains(text(),'Digital Marketing')]
          Element Text Should Be          xpath://p[contains(text(),'Digital Marketing')]          Digital Marketing
          Wait Until Element Is Visible          xpath://p[contains(text(),'Programming & Tech')]
          Element Text Should Be          xpath://p[contains(text(),'Programming & Tech')]          Programming & Tech
          Wait Until Element Is Visible          xpath://p[contains(text(),'Business')]
          Element Text Should Be          xpath://p[contains(text(),'Business')]          Business
          Wait Until Element Is Visible          xpath://p[contains(text(),'Music & Audio')]
          Element Text Should Be          xpath://p[contains(text(),'Music & Audio')]          Music & Audio
          Wait Until Element Is Visible          xpath://p[contains(text(),'Lifestyle')]
          Element Text Should Be          xpath://p[contains(text(),'Lifestyle')]          Lifestyle
          Wait Until Element Is Visible          xpath://p[contains(text(),'Other')]
          Element Text Should Be          xpath://p[contains(text(),'Other')]          Other
          Wait Until Element Is Visible          xpath://a[contains(text(),'Back')]
          Element Should Be Enabled          xpath://a[contains(text(),'Back')]
          Element Text Should Be          xpath://a[contains(text(),'Back')]          Back
          Wait Until Element Is Visible          xpath://button[contains(text(),'Next')]
          Element Should Be Disabled          xpath://button[contains(text(),'Next')]
          Element Text Should Be          xpath://button[contains(text(),'Next')]          Next
          #set 2nd step
          Scroll Element Into View          xpath=//a[contains(text(),'Back')]
          #Click Element          xpath://p[contains(text(),'Programming & Tech')]
          Click Element          xpath://p[contains(text(),'Graphic & Design')]
          Capture Page Screenshot          vector-{index}.png
          Element Should Be Visible          xpath://div[@class="MultipleSelectHeading_multipleSelectHeading__1WmGV PostAJobStep2_subCategorySelectHeading__2im8-"]
          Click Element          xpath=//body/div[@id='root']/div[1]/section[1]/div[4]/div[1]/div[1]/div[2]/div[1]/i[1]
          Sleep          1
          #Click Element          xpath://div[@class="MultipleSelectDropdown_multipleSelectDropdown__2q2u6 PostAJobStep2_subCategoryDropdown__TiR8g"]/button[2]//i[@class="light undefined fas fa-check checkmarkIcon"]
          #sub-c
          #Click Element          xpath=//button[@id='qa-&-testing']          QA & Testing
          Click Element          xpath=//button[@id='logo-design']          #Logo Design
          Sleep          1
          #Click Element          xpath=//button[@id='web-&-mobile-design']
          Click Element          xpath://div[@class="MultipleSelectHeading_multipleSelectHeading__1WmGV PostAJobStep2_subCategorySelectHeading__2im8-"]/h2
          Capture Page Screenshot          vector-{index}.png
          Input Text          xpath://input[@class="input undefined"]          Skills
          Click Element          xpath=//body/div[@id='root']/div[1]/section[1]/div[4]/div[1]/div[1]/div[4]/div[1]/div[1]/div[1]/div[1]/i[1]          #+
          Element Should Be Visible          xpath://div[@class="PostAJobStep2_categoryData__1Aa-r"]/p
          Get Text          xpath://div[@class="PostAJobStep2_categoryData__1Aa-r"]/p
          Capture Page Screenshot          skills-{index}.png
          #Click Element          class=light undefined fa fa-times Tag_tag__remove__icon__1ti4w
          Element Should Not Be Visible          xpath://div[@class="Tag_tag__3sBKJ "]/p
          Scroll Element Into View          xpath=//a[contains(text(),'Back')]
          Capture Page Screenshot          skills-{index}.png
          Wait Until Element Is Visible          xpath=//button[@class="buttonBtn PostAJobStep2_btnNext__CywN3"]
          Scroll Element Into View          xpath=//button[@class="buttonBtn PostAJobStep2_btnNext__CywN3"]
          Element Should Be Enabled          xpath=//button[@class="buttonBtn PostAJobStep2_btnNext__CywN3"]
          Click Element          xpath=//button[@class="buttonBtn PostAJobStep2_btnNext__CywN3"]

Post a Job - 3rd step
          [Tags]          postajob
          ${url} =          Get Location
          Log to console          ${url}
          Header Post a Job
          Wait Until Element Is Visible          xpath://h2[contains(text(),'Select the type of job')]
          Element Text Should Be          xpath://h2[contains(text(),'Select the type of job')]          Select the type of job
          #3rd step
          Wait Until Element Is Visible          xpath://h2[contains(text(),'Select the type of job')]
          Element Text Should Be          xpath://h2[contains(text(),'Select the type of job')]          Select the type of job
          Element Should Be Visible          class:JobTypeCard_jobTypeCard__3s3DX
          Element Text Should Be          xpath://h2[contains(text(),'Post a project?')]          Post a project?
          Element Text Should Be          xpath://h2[contains(text(),'Start a contest?')]          Start a contest?
          Element Text Should Be          xpath://div[1]/div[1]/div[1]/div[2]/p[1]          You have a project which needs to be done, and you need a qualified person to finish it. Post a project, describe what are you looking for, determine the application deadline, and wait for the proposals!
          Element Text Should Be          xpath://div[1]/div[1]/div[2]/div[2]          You want to choose the product you like the most? Run a contest, give clear instructions, determine a deadline, and wait for the right product to come to you!
          Element Should Be Visible          xpath://a[contains(text(),'Back')]
          Element Should Be Enabled          xpath://a[contains(text(),'Back')]
          Element Should Be Visible          xpath://button[contains(text(),'Next')]
          Element Should Be Disabled          xpath://button[contains(text(),'Next')]
          Scroll Element Into View          xpath://button[contains(text(),'Next')]
          Capture Page Screenshot          3rd step-{index}.png
          Scroll Element Into View          xpath=//a[contains(text(),'Back')]
          Capture Page Screenshot          select-contest-{index}.png
          Click Element          xpath://h2[contains(text(),'Post a project?')]
          Wait Until Element Is Visible          xpath://button[contains(text(),'Next')]
          Element Should Be Enabled          xpath://button[contains(text(),'Next')]
          Click Element          xpath://button[contains(text(),'Next')]
          Sleep          5

Post a Job - 4th step
          [Tags]          postajob
          ${url} =          Get Location
          Log to console          ${url}
          Header Post a Job
          Wait Until Element Is Visible          xpath=//section[1]/div[4]/div[1]/div[1]/form[1]/h2[1]
          Element Text Should Be          xpath=//section[1]/div[4]/div[1]/div[1]/form[1]/h2[1]          Define your Project
          #4th step
          Wait Until Element Is Visible          class=PostAJobStep4_projectContainer__nX9oP
          Wait Until Element Is Visible          xpath://button[contains(text(),'Login & Preview')]
          Click Button          xpath://button[contains(text(),'Login & Preview')]
          #alert
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[1]/div[1]/div[1]/div[2]
          Element Should Be Visible          xpath=//form[1]/div[1]/div[1]/div[1]/div[1]/div[2]
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[1]/div[1]/div[2]          * Required
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[1]/div[5]/div[1]/div[2]
          Element Should Be Visible          xpath=//form[1]/div[1]/div[1]/div[5]/div[1]/div[2]
          Element Text Should Be          xpath=//form[1]/div[1]/div[1]/div[5]/div[1]/div[2]          * Required
          Wait Until Element Is Visible          xpath=//form[1]/div[1]/div[3]/div[2]/div[1]
          Element Should Be Visible          xpath=//form[1]/div[1]/div[3]/div[2]/div[1]
          Element Text Should Be          xpath=//form[1]/div[1]/div[3]/div[2]/div[1]          * Required
          #Add Project Description
          Scroll Element Into View          xpath=//form[1]/div[1]/div[2]/p[1]
          Click Element          xpath=//body/div[@id='root']/div[1]/section[1]/div[4]/div[1]/div[1]/form[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]
          Click Element          xpath=//div[contains(text(),'Serbia')]
          Click Element          xpath=//body/div[@id='root']/div[1]/section[1]/div[4]/div[1]/div[1]/form[1]/div[1]/div[1]/div[5]/div[1]/div[1]/div[1]
          Click Element          xpath=//form[1]/div[1]/div[1]/div[5]/div[1]/div[1]/div[2]/div[1]/div[1]
          Scroll Element Into View          xpath://button[contains(text(),'Login & Preview')]
          Input Text          name=totalPrice          55
          Capture Page Screenshot          post-{index}.png
          Click Button          xpath://button[contains(text(),'Login & Preview')]

Login business
          Wait Until Element Is Visible          name=emailOrUserName
          Capture Page Screenshot          login.-{index}.png
          Login modal dialog
          Input Text          name=emailOrUserName          ${business1}
          Input Text          name:password          ${password}
          Click Element          id:login

Preview Job Page
          Sleep          5
          Capture Page Screenshot          login-{index}.png
          Wait Until Element Is Visible          class=PostAJobPreviewJob_postAJobPreviewJobMainContainer__2bq6F
          Capture Page Screenshot          preview-a-job-{index}.png
          #header preview a Job
          Wait Until Element Is Visible          xpath://a[contains(text(),'Up For Jobs')]
          Element Text Should Be          xpath://a[contains(text(),'Up For Jobs')]          Up For Jobs
          Wait Until Element Is Visible          xpath://body/div[@id='root']/div[1]/section[1]/div[1]/a[2]
          Element Text Should Be          xpath://body/div[@id='root']/div[1]/section[1]/div[1]/a[2]          Preview Job
          Wait Until Element Is Visible          xpath://body/div[@id='root']/div[1]/section[1]/div[2]/h2[1]/span[1]
          Element Text Should Be          xpath://body/div[@id='root']/div[1]/section[1]/div[2]/h2[1]          Post a Job
          #${title} =          Get Text          class=PostAJobPreviewJob_postAJobPreviewDesc__1_mMp
          #Log To Console          ${title}
          #${description} =          Get Text          class=PostAJobPreviewJob_urgentBtn__2C3YJ
          #Log To Console          ${description}
          #${description} =          Get Text          class=PostAJobPreviewJob_postAJobPreviewInfo__2uY5T
          #Log To Console          ${description}
          Sleep          2
          Element Should Be Enabled          xpath=//a[contains(text(),'Edit')]
          Element Should Be Visible          xpath=//a[contains(text(),'Edit')]
          Element Text Should Be          xpath=//a[contains(text(),'Edit')]          Edit
          Element Should Be Enabled          xpath=//button[contains(text(),'Publish Job')]
          Element Should Be Visible          xpath=//button[contains(text(),'Publish Job')]
          Element Text Should Be          xpath=//button[contains(text(),'Publish Job')]          Publish Job
          Click Button          xpath=//button[contains(text(),'Publish Job')]

Congrats modal
          Sleep          3
          #Congrats Project modal dialog
          Congrats Project modal dialog
          Click Element          id=Sealed
          Click Element          id=Extent
          Click Element          id=Private
          Click Element          id=TopProject
          Click Element          id=Highlight
          Click Element          id=Urgent
          Click Element          id=Featured
          Click Element          id=Guaranteed
          Click Element          id=Request to sign NDA
          Capture Page Screenshot          BOOST-FEATURES-{index}.png
          Element Should Be Enabled          xpath=//button[contains(text(),'Finish')]
          Element Should Be Visible          xpath=//button[contains(text(),'Finish')]
          Element Text Should Be          xpath=//button[contains(text(),'Finish')]          Finish
          Click Button          xpath=//button[contains(text(),'Finish')]
          Capture Page Screenshot          congrats-{index}.png

Thank you page
          Sleep          3
          Click Element          xpath=//body/div[@id='root']/div[1]/div[1]/section[1]/img[1]
          Scroll Element Into View          xpath=//body/div[@id='root']/div[1]/div[1]/section[1]/div[1]/p[1]
          Capture Page Screenshot          finish-{index}.png

My Jobs
          Sleep          5
          Element Should Be Visible          class=MyJobs_myJobsMainContainer__2rWbh
          Element Should Be Visible          class=MyJobs_leftSideContainer__tPE4X
          Get Text          class=MyJobsJobCard_myJobsDesc__20kBO
          Capture Page Screenshot          my-jobs-{index}.png

Single post job
          Wait Until Element Is Visible          class=MyJobsJobCard_myJobsDesc__20kBO
          Element Should Be Enabled          class=MyJobsJobCard_myJobsDesc__20kBO
          Click Element          class=MyJobsJobCard_myJobsDesc__20kBO
          Get Locations
          Wait Until Element Is Visible          class=SingleJobPost_titlecontainer__1u5hd
          Wait Until Element Is Visible          class=SingleJobPostDetail_jobDetailCard__1SBcL
          Element Should Be Visible          class=SingleJobPostDetail_jobDetailCard__1SBcL
          Wait Until Element Is Visible          class=SingleJobPostDetail_nameContainer__1hyqS
          Wait Until Element Is Visible          class=SingleJobPostDetail_jobInfoContainer__2B0gG
          Element Should Be Visible          class=SingleJobPostDetail_jobInfoContainer__2B0gG
          Capture Page Screenshot          single-posted-job-{index}.png
          Wait Until Element Is Visible          xpath=//div[1]/div[2]/div[1]/h4[1]
          Element Should Be Visible          xpath=//div[1]/div[2]/div[1]/h4[1]
          Element Text Should Be          xpath=//div[1]/div[2]/div[1]/h4[1]          ${number_title}

Logout
          LogoutKW
