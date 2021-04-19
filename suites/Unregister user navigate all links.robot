*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 SeleniumLibrary
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 XvfbRobot

*** Variables ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login to the website
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          class=Login_headingText__2QdrP
          Input Text          id=emailOrUserName          ufj
          Input Text          id=password          ${ufjpass}
          Submit Form

Landing Page
          #landing page
          Navheader Unregistered
          #Unregistered Landing page
          Wait Until Element Is Visible          class=Hero_heroInfo__vWqZ2
          Wait Until Element Is Visible          xpath=//button[@id='hire']
          Element Should Be Visible          xpath=//button[@id='hire']
          Element Should Be Enabled          xpath=//button[@id='hire']
          Wait Until Element Is Visible          xpath=//button[@id='getHired']
          Element Should Be Visible          xpath=//button[@id='getHired']
          Element Should Be Enabled          xpath=//button[@id='getHired']
          Wait Until Element Is Visible          class=SectorForBusiness_sectorForBusinessCardContainer__2C3cb
          Wait Until Element Is Visible          xpath=//section[1]/section[3]/div[3]/a[1]
          Scroll Element Into View          xpath=//section[1]/section[3]/div[3]/a[1]
          Capture Page Screenshot          Uprated-Freelancers-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Uprated Freelancers')]
          Element Text Should Be          xpath=//h2[contains(text(),'Uprated Freelancers')]          Uprated Freelancers
          Wait Until Element Is Visible          class=UpRatedFreelancers_UpRatedFreelancers__2gEFP
          Wait Until Element Is Visible          xpath=//section[1]/section[3]/div[3]/a[1]
          Element Should Be Visible          xpath=//section[1]/section[3]/div[3]/a[1]
          Element Should Be Enabled          xpath=//section[1]/section[3]/div[3]/a[1]
          Element Text Should Be          xpath=//section[1]/section[3]/div[3]/a[1]          View All
          Scroll Element Into View          xpath=//h2[contains(text(),'One Click Contest Builder')]
          Capture Page Screenshot          One-Click-Contest-Builder-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'One Click Contest Builder')]
          Element Should Be Visible          xpath=//h2[contains(text(),'One Click Contest Builder')]
          Element Text Should Be          xpath=//h2[contains(text(),'One Click Contest Builder')]          One Click Contest Builder
          Scroll Element Into View          xpath=//section[4]/div[2]/a[1]
          Capture Page Screenshot          Top-Freelancers-Ready-To-DesignYour-Logo-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Freelancers Ready To Design Your Logo')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Freelancers Ready To Design Your Logo')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Freelancers Ready To Design Your Logo')]          Top Freelancers Ready To Design Your Logo
          Wait Until Element Is Visible          xpath=//section[4]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[4]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[4]/div[2]/a[1]
          Element Text Should Be          xpath=//section[4]/div[2]/a[1]          View All
          Scroll Element Into View          xpath=//section[5]/div[2]/a[1]
          Capture Page Screenshot          Top-Freelancers-To-Design-Your-Book-Cover-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Freelancers To Design Your Book Cover')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Freelancers To Design Your Book Cover')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Freelancers To Design Your Book Cover')]          Top Freelancers To Design Your Book Cover
          Wait Until Element Is Visible          xpath=//section[5]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[5]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[5]/div[2]/a[1]
          Element Text Should Be          xpath=//section[5]/div[2]/a[1]          View All
          Scroll Element Into View          xpath=//section[6]/div[2]/a[1]
          Capture Page Screenshot          Top-Freelancers-Ready-To-Create-Your-Business-Plan-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Freelancers Ready To Create Your Business Plan')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Freelancers Ready To Create Your Business Plan')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Freelancers Ready To Create Your Business Plan')]          Top Freelancers Ready To Create Your Business Plan
          Wait Until Element Is Visible          xpath=//section[6]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[6]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[6]/div[2]/a[1]
          Element Text Should Be          xpath=//section[6]/div[2]/a[1]          View All
          Wait Until Element Is Visible          class=WhatMakesUsDifferent_whatMakesUsDifferentContainer__14yoY
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'WHAT MAKES US DIFFERENT?')]
          Scroll Element Into View          xpath=//section[8]/div[2]/a[1]
          Capture Page Screenshot          Top-Freelancers-To-Help-You-Sell-Your-Products-&-Services-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Freelancers To Help You Sell Your Products & S')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Freelancers To Help You Sell Your Products & S')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Freelancers To Help You Sell Your Products & S')]          Top Freelancers To Help You Sell Your Products & Services
          Wait Until Element Is Visible          xpath=//section[8]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[8]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[8]/div[2]/a[1]
          Element Text Should Be          xpath=//section[8]/div[2]/a[1]          View All
          Scroll Element Into View          xpath=//section[9]/div[2]/a[1]
          Capture Page Screenshot          Top-Content-Writing-Freelancers-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Content Writing Freelancers')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Content Writing Freelancers')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Content Writing Freelancers')]          Top Content Writing Freelancers
          Wait Until Element Is Visible          xpath=//section[9]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[9]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[9]/div[2]/a[1]
          Element Text Should Be          xpath=//section[9]/div[2]/a[1]          View All
          Scroll Element Into View          xpath=//section[10]/div[2]/a[1]
          Capture Page Screenshot          Top-Voice-Over-Freelancers-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Voice Over Freelancers')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Voice Over Freelancers')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Voice Over Freelancers')]          Top Voice Over Freelancers
          Wait Until Element Is Visible          xpath=//section[10]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[10]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[10]/div[2]/a[1]
          Element Text Should Be          xpath=//section[10]/div[2]/a[1]          View All
          Scroll Element Into View          xpath=//section[11]/div[2]/a[1]
          Capture Page Screenshot          Top-Voice-Over-Freelancers-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Voice Over Freelancers')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Voice Over Freelancers')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Voice Over Freelancers')]          Top Voice Over Freelancers
          Wait Until Element Is Visible          xpath=//section[11]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[11]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[11]/div[2]/a[1]
          Element Text Should Be          xpath=//section[11]/div[2]/a[1]          View All
          Scroll Element Into View          xpath=//section[12]/div[2]/a[1]
          Capture Page Screenshot          To-Freelancers-To-Create-Your-Fundraising-PitchBook-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Freelancers To Create Your Fundraising PitchBo')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Freelancers To Create Your Fundraising PitchBo')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Freelancers To Create Your Fundraising PitchBo')]          Top Freelancers To Create Your Fundraising PitchBook
          Wait Until Element Is Visible          xpath=//section[12]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[12]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[12]/div[2]/a[1]
          Element Text Should Be          xpath=//section[12]/div[2]/a[1]          View All
          Scroll Element Into View          xpath=//section[13]/div[2]/a[1]
          Capture Page Screenshot          Top-Freelancers-Ready-To-Valuate-Your-Startu-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Freelancers Ready To Valuate Your Startup')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Freelancers Ready To Valuate Your Startup')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Freelancers Ready To Valuate Your Startup')]          Top Freelancers Ready To Valuate Your Startup
          Wait Until Element Is Visible          xpath=//section[13]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[13]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[13]/div[2]/a[1]
          Element Text Should Be          xpath=//section[13]/div[2]/a[1]          View All
          Scroll Element Into View          xpath=//section[14]/div[2]/a[1]
          Capture Page Screenshot          Top-Freelancers-To-Help-You-Market-your-Book-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Top Freelancers To Help You Market your Book')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Top Freelancers To Help You Market your Book')]
          Element Text Should Be          xpath=//h2[contains(text(),'Top Freelancers To Help You Market your Book')]          Top Freelancers To Help You Market your Book
          Wait Until Element Is Visible          xpath=//section[14]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[14]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[14]/div[2]/a[1]
          Element Text Should Be          xpath=//section[14]/div[2]/a[1]          View All
          #Freelancer Certification
          Wait Until Element Is Visible          xpath=//section[15]/div[1]/div[1]/h2[1]
          Element Should Be Visible          xpath=//section[15]/div[1]/div[1]/h2[1]
          Element Text Should Be          xpath=//section[15]/div[1]/div[1]/h2[1]          Get consistent work by becoming a Certified FreelancerTM
          Wait Until Element Is Visible          class=FreelancerCertification_freelancerCertificationContainer__2GtRp
          Wait Until Element Is Visible          xpath=//section[16]/div[3]/a[1]
          Scroll Element Into View          xpath=//section[16]/div[3]/a[1]
          Capture Page Screenshot          Popular-Jobs-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Popular Jobs')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Popular Jobs')]
          Element Text Should Be          xpath=//h2[contains(text(),'Popular Jobs')]          Popular Jobs
          Wait Until Element Is Visible          xpath=//section[16]/div[3]/a[1]
          Element Should Be Visible          xpath=//section[16]/div[3]/a[1]
          Element Should Be Enabled          xpath=//section[16]/div[3]/a[1]
          Element Text Should Be          xpath=//section[16]/div[3]/a[1]          View All
          Wait Until Element Is Visible          class=SocialTestimonials_socialCard__8yFvx
          Scroll Element Into View          xpath=//section[18]/div[2]/a[1]
          Capture Page Screenshot          New-Freelancers-{index}.png
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'New Freelancers')]
          Element Should Be Visible          xpath=//h2[contains(text(),'New Freelancers')]
          Element Text Should Be          xpath=//h2[contains(text(),'New Freelancers')]          New Freelancers
          Wait Until Element Is Visible          xpath=//section[18]/div[2]/a[1]
          Element Should Be Visible          xpath=//section[18]/div[2]/a[1]
          Element Should Be Enabled          xpath=//section[18]/div[2]/a[1]
          Element Text Should Be          xpath=//section[18]/div[2]/a[1]          View All
          Wait Until Element Is Visible          xpath=//section[19]/div[2]/div[2]/button[1]
          Element Should Be Visible          xpath=//section[19]/div[2]/div[2]/button[1]
          Element Text Should Be          xpath=//section[19]/div[2]/div[2]/button[1]          Hire
          Element Should Be Enabled          xpath=//section[19]/div[2]/div[2]/button[1]
          Wait Until Element Is Visible          xpath=//section[19]/div[2]/div[2]/button[2]
          Element Should Be Visible          xpath=//section[19]/div[2]/div[2]/button[2]
          Element Should Be Enabled          xpath=//section[19]/div[2]/div[2]/button[2]
          Element Text Should Be          xpath=//section[19]/div[2]/div[2]/button[2]          Get Hired

How it Works page
          Wait Until Element Is Visible          xpath=//a[@id='howItWorks']
          Click Element          id=howItWorks
          Capture Page Screenshot          howItWorks- {index}.png

Find a Job
          Click Element          id=findAJobLink
          Navheader Unregistered
          Capture Page Screenshot          postAJobNavButton-{index}.png
