*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 String
Library                 XfbRobot

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
          Capture Page Screenshot          enterthe-website-{index}.png
          Login Freelancer KW

Find a job
          Navheader Freelancer
          Click Element          id=findAJob
          #breadcrumb Find a job
          Wait Until Element Is Visible          xpath=//a[contains(text(),'UpForJobs')]
          Element Should Be Visible          xpath=//a[contains(text(),'UpForJobs')]
          Element Text Should Be          xpath=//a[contains(text(),'UpForJobs')]          UpForJobs
          Element Should Be Enabled          xpath=//a[contains(text(),'UpForJobs')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Find A Job')]
          Element Should Be Visible          xpath=//a[contains(text(),'Find A Job')]
          Element Text Should Be          xpath=//a[contains(text(),'Find A Job')]          Find A Job
          Element Should Be Enabled          xpath=//a[contains(text(),'Find A Job')]
          Radio Button Should Be Set To          jobType          All Jobs
          Select Radio Button          jobType          Contests
          Wait Until Element Is Visible          xpath=//div[2]/div[2]/div[1]/a[1]/div[2]
          Click Element          xpath=//div[2]/div[2]/div[1]/a[1]/div[2]
          Capture Page Screenshot          find-a-job-{index}.png

Upload submission
          #breadcumb contest
          Wait Until Element Is Visible          xpath=//a[contains(text(),'UpForJobs')]
          Wait Until Element Is Enabled          xpath=//a[contains(text(),'UpForJobs')]
          Element Should Be Visible          xpath=//a[contains(text(),'UpForJobs')]
          Element Text Should Be          xpath=//a[contains(text(),'UpForJobs')]          UpForJobs
          Wait Until Element Is Visible          xpath=//div[1]/div[1]/div[1]/a[2]
          Wait Until Element Is Enabled          xpath=//div[1]/div[1]/div[1]/a[2]
          Element Should Be Visible          xpath=//div[1]/div[1]/div[1]/a[2]
          Element Text Should Be          xpath=//div[1]/div[1]/div[1]/a[2]          My Jobs
          #single job post
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Details')]
          Wait Until Element Is Enabled          xpath=//div[contains(text(),'Details')]
          Element Should Be Visible          xpath=//div[contains(text(),'Details')]
          Element Text Should Be          xpath=//div[contains(text(),'Details')]          Details
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Submissions')]
          Wait Until Element Is Enabled          xpath=//div[contains(text(),'Submissions')]
          Element Should Be Visible          xpath=//div[contains(text(),'Submissions')]
          Element Text Should Be          xpath=//div[contains(text(),'Submissions')]          Submissions
          ${description}=          Get Text          class=SingleJobPostDetail_jobDetailCard__1SBcL
          Log To Console          ${description}
          ${features}=          Get Text          class=SingleJobPostDetailFeature_featureCard__2SeFz
          Log To Console          ${features}
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Upload your submission')]
          Element Should Be Enabled          xpath=//button[contains(text(),'Upload your submission')]
          Scroll Element Into View          xpath=//button[contains(text(),'Upload your submission')]
          Click Element          xpath=//button[contains(text(),'Upload your submission')]
          Input Text          id=amount          10
          Input Text          id=description          ${description1}
          Sleep          1
          Scroll Element Into View          xpath=//button[contains(text(),'Apply')]
          ${id} =          Generate Random String          2          [NUMBERS]
          Element Should Be Enabled          id=uploadFiles
          Choose File          id=uploadFiles          ${CURDIR}\\random\\${id}.jpg
          Capture Page Screenshot          attached-files-{index}.png
          Sleep          1
          Click Element          xpath=//button[contains(text(),'Apply')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Submission Successful')]
          Wait Until Element Is Enabled          xpath=//div[contains(text(),'Submission Successful')]
          Element Should Be Visible          xpath=//div[contains(text(),'Submission Successful')]
          Element Text Should Be          xpath=//div[contains(text(),'Submission Successful')]          Submission Successful
          Capture Page Screenshot          Submission-Successful-{index}.png
          Sleep          5
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Details')]
          Click Element          xpath=//div[contains(text(),'Details')]

Submission
          Upload submission kw
          Upload submission kw
          Upload submission kw
          Upload submission kw
          Upload submission kw
          Upload submission kw
          Upload submission kw
          Upload submission kw
          Upload submission kw

Logout
          LogoutKW
