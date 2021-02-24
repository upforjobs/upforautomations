*** Settings ***
Suite Setup             Open Testbrowser
Suite Teardown          Close All Browsers
Library                 Collections
Resource                _keywords.txt
Resource                _mysetup.txt
Library                 SeleniumLibrary
Library                 String
Library                 XvfbRobot

*** Variable ***
${TMP_PATH}             /tmp

*** Test Cases ***
Login user
          [Tags]          saveSettings
          Login Freelancer KW

Mini dashboard
          #mini-dashboard
          #mode
          Wait Until Element Is Visible          xpath://a[contains(text(),'Hi ${freelancer},')]
          Element Should Be Visible          xpath://a[contains(text(),'Hi ${freelancer},')]
          Element Text Should Be          xpath://a[contains(text(),'Hi ${freelancer},')]          ${freelancer}
          Element Should Be Visible          class=MiniDashboard_statusMode__2BWW7
          Element Text Should Be          xpath://h4[contains(text(),'You are logged in.')]          You are logged in.
          Element Text Should Be          xpath://h4[contains(text(),'My Profile Viewers')]          My Profile Viewers
          Element Text Should Be          xpath://h4[contains(text(),'Complete your profile')]          Complete your profile
          Element Text Should Be          xpath://h4[contains(text(),'My Jobs')]          My Jobs
          Element Text Should Be          xpath://h4[contains(text(),'Finance')]          Finance
          Element Text Should Be          xpath=//div[2]/div[1]/div[1]/div[1]/h4[1]          Mode:
          Capture Page Screenshot          landing-page-{index}.png
          Click Element          xpath://a[contains(text(),'Hi ${freelancer},')]
          Sleep          1
          Capture Page Screenshot          profile-page-{index}.png

My Profile
          Freelancer profile right container raw

Create 1st Collection
          Click Element          xpath=//button[contains(.,'Add items')]
          Wait Until Element Is Not Visible          xpath=//button[contains(.,'Add items')]
          Capture Page Screenshot          add-items-{index}.png
          Portfolio Breadcrumbs
          Raw Portfolio page
          Click Element          xpath=//div[1]/div[1]/div[2]/div[1]/div[2]/button[1]
          Sleep          1
          Create Collection page
          #Create Collection
          ${number_title}          Generate Random String          1          [NUMBERS]
          ${random_title}          Generate Random String          5          [LETTERS]
          Input Text          id=title          No ${number_title} Collection ${random_title}
          Capture Page Screenshot          title-{index}.png
          #description
          ${number_description}          Generate Random String          1          [LETTERS]
          ${random_description}          Generate Random String          5          [LETTERS]
          Input Text          id=description          No ${number_description} Collection ${description1} ${random_description}
          Scroll Element Into View          xpath=//form[1]/div[2]/div[1]/img[1]
          Capture Page Screenshot          description-{index}.png
          #command
          ${id} =          Generate Random String          1          [NUMBERS]
          Choose File          class=ManagePortfolio_FileInputSquare__input__39gdc          ${CURDIR}\\random\\c0${id}.jpg
          Wait Until Element Is Visible          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          Capture Element Screenshot          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          #          //form[1]/div[2]/div[2]/div[1]
          Sleep          1
          Scroll Element Into View          xpath=//div[1]/div[1]/div[2]/div[1]/div[5]/div[1]
          Capture Page Screenshot          capture-{index}.png
          Click Button          xpath=//form[1]/div[3]/button[1]
          #Save collection
          Element Should Be Enabled          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          Click Button          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          #modal
          Portfolio modal
          #command
          Click Element          xpath=//div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/div[2]/div[3]/a[2]/button[1]
          Wait Until Element Is Visible          class=Profile_profileRightSideContainer__A6iXd
          Capture Element Screenshot          class=Profile_profileRightSideContainer__A6iXd

Create 2nd collection
          Capture Page Screenshot          2nd-collection-{index}.png
          Wait Until Element Is Visible          xpath=//p[contains(.,'edit')]
          Click Element          xpath=//p[contains(.,'edit')]
          Wait Until Element Is Visible          xpath=//button[@id='addCollection']/i
          Click Element          xpath=//button[@id='addCollection']/i
          #create collection kw
          Create Collection page
          #Create Collection
          ${number_title}          Generate Random String          1          [NUMBERS]
          ${random_title}          Generate Random String          5          [LETTERS]
          Input Text          id=title          No ${number_title} Collection ${random_title}
          Capture Page Screenshot          title-{index}.png
          #description
          ${number_description}          Generate Random String          1          [LETTERS]
          ${random_description}          Generate Random String          5          [LETTERS]
          Input Text          id=description          No ${number_description} Collection ${description1} ${random_description}
          Scroll Element Into View          xpath=//form[1]/div[2]/div[1]/img[1]
          Capture Page Screenshot          description-{index}.png
          #command
          ${id} =          Generate Random String          1          [NUMBERS]
          Choose File          class=ManagePortfolio_FileInputSquare__input__39gdc          ${CURDIR}\\random\\c0${id}.jpg
          Wait Until Element Is Visible          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          Capture Element Screenshot          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          Sleep          1
          Scroll Element Into View          xpath=//button[@id='savePortfolio']
          Capture Page Screenshot          capture-{index}.png
          Click Button          xpath=//form[1]/div[3]/button[1]
          #Save collection
          Element Should Be Enabled          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          Click Button          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          #modal
          Portfolio modal
          #command
          Wait Until Element Is Visible          xpath=//div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/div[2]/div[3]/a[2]/button[1]
          Click Element          xpath=//div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/div[2]/div[3]/a[2]/button[1]
          Wait Until Element Is Visible          class=Profile_profileRightSideContainer__A6iXd
          Capture Element Screenshot          class=Profile_profileRightSideContainer__A6iXd

Create 3rd ceollection
          Capture Page Screenshot          3rd-collection-{index}.png
          Wait Until Element Is Visible          xpath=//p[contains(.,'edit')]
          Click Element          xpath=//p[contains(.,'edit')]
          Wait Until Element Is Visible          xpath=//button[@id='addCollection']/i
          Click Element          xpath=//button[@id='addCollection']/i
          #create collection kw
          Create Collection page
          #Create Collection
          ${number_title}          Generate Random String          1          [NUMBERS]
          ${random_title}          Generate Random String          5          [LETTERS]
          Input Text          id=title          No ${number_title} Collection ${random_title}
          Capture Page Screenshot          title-{index}.png
          #description
          ${number_description}          Generate Random String          1          [LETTERS]
          ${random_description}          Generate Random String          5          [LETTERS]
          Input Text          id=description          No ${number_description} Collection ${description1} ${random_description}
          Scroll Element Into View          xpath=//form[1]/div[2]/div[1]/img[1]
          Capture Page Screenshot          description-{index}.png
          #command
          ${id} =          Generate Random String          1          [NUMBERS]
          Choose File          class=ManagePortfolio_FileInputSquare__input__39gdc          ${CURDIR}\\random\\c0${id}.jpg
          Wait Until Element Is Visible          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          Capture Element Screenshot          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          #          //form[1]/div[2]/div[2]/div[1]
          Sleep          1
          Scroll Element Into View          xpath=//button[@id='savePortfolio']
          Capture Page Screenshot          capture-{index}.png
          Click Button          xpath=//form[1]/div[3]/button[1]
          #Save collection
          Element Should Be Enabled          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          Click Button          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          #modal
          Portfolio modal
          #command
          Click Element          xpath=//div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/div[2]/div[3]/a[2]/button[1]
          Wait Until Element Is Visible          class=Profile_profileRightSideContainer__A6iXd
          Capture Element Screenshot          class=Profile_profileRightSideContainer__A6iXd

Create 4th collection
          Capture Page Screenshot          4th-collection-{index}.png
          Wait Until Element Is Visible          xpath=//p[contains(.,'edit')]
          Click Element          xpath=//p[contains(.,'edit')]
          Wait Until Element Is Visible          xpath=//button[@id='addCollection']/i
          Click Element          xpath=//button[@id='addCollection']/i
          #create collection kw
          Create Collection page
          #Create Collection
          ${number_title}          Generate Random String          1          [NUMBERS]
          ${random_title}          Generate Random String          5          [LETTERS]
          Input Text          id=title          No ${number_title} Collection ${random_title}
          Capture Page Screenshot          title-{index}.png
          #description
          ${number_description}          Generate Random String          1          [LETTERS]
          ${random_description}          Generate Random String          5          [LETTERS]
          Input Text          id=description          No ${number_description} Collection ${description1} ${random_description}
          Scroll Element Into View          xpath=//form[1]/div[2]/div[1]/img[1]
          Capture Page Screenshot          description-{index}.png
          #command
          ${id} =          Generate Random String          1          [NUMBERS]
          Choose File          class=ManagePortfolio_FileInputSquare__input__39gdc          ${CURDIR}\\random\\c0${id}.jpg
          Wait Until Element Is Visible          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          Capture Element Screenshot          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[4]/form[1]/div[2]/div[1]/div[1]
          #          //form[1]/div[2]/div[2]/div[1]
          Click Element          xpath=//form[1]/div[3]/button[1]
          Sleep          2
          Scroll Element Into View          xpath=//button[@id='savePortfolio']
          Capture Page Screenshot          capture-{index}.png
          Click Button          xpath=//button[@id='savePortfolio']
          Sleep          3
          #Save collection
          #Element Should Be Enabled          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          #Click Button          xpath=//div[1]/div[1]/div[2]/div[1]/div[3]/div[3]/button[1]
          #modal
          #command
          #Click Button          xpath=//body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[2]/div[3]/a[2]/button[1]
          Click Element          xpath=//div[2]/div[3]/a[1]/button[1]
          Capture Page Screenshot          Profile-profileRightSideContainer-{index}.png

Delete collections
          mini-dashboard
          Click Element          xpath://a[contains(text(),'Hi ${freelancer},')]
          Sleep          1
          Capture Page Screenshot          profile-page-{index}.png
          Wait Until Element Is Visible          xpath=//p[contains(.,'edit')]
          Scroll Element Into View          xpath=//p[contains(.,'edit')]
          #Click Element          xpath=//button[contains(.,'Add items')]
          #Wait Until Element Is Visible          xpath=//p[contains(.,'edit')]
          Click Element          xpath=//p[contains(.,'edit')]
          Capture Page Screenshot          delete-collection-{index}.png
          Scroll Element Into View          xpath=//button[@id='savePortfolio']
          Capture Page Screenshot          capture-{index}.png
          Click Element          xpath=//div[3]/img
          Sleep          1
          Click Element          xpath=//div[3]/img
          Sleep          1
          Click Element          xpath=//div[3]/img
          Sleep          1
          Click Element          xpath=//div[3]/img
          Sleep          1
          Click Element          id=savePortfolio
          Portfolio modal
          Capture Page Screenshot          modal-{index}.png
          Click Element          xpath=//div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/div[2]/div[3]/a[2]/button[1]
          Capture Page Screenshot          my-profile-{index}.png
          Wait Until Element Is Visible          xpath=//button[contains(.,'Add items')]
          Element Should Be Enabled          xpath=//button[contains(.,'Add items')]
          Click Element          xpath=//button[contains(.,'Add items')]
          Portfolio Breadcrumbs
          Raw Portfolio page

Logout
          LogoutKW
