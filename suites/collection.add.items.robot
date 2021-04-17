*** Settings ***
Documentation           I this test case scenatio we are testing Login form, Landing pge, My Profile page, Manage portfolio pate.
...                     Interactions with alert messages and required fields.
...                     Createing protfolio with maximum items (10)
...                     Create maximum numbers of collections (6)
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
Login
          Maximize Browser Window
          Go To          ${TESTURL}
          Wait Until Element Is Visible          class=Login_headingText__2QdrP
          Input Text          id=emailOrUserName          ufj
          Input Text          id=password          ${ufjpass}
          Submit Form

Login user
          [Documentation]          In this test scenario we are testing Login user freelancer,input credentials Freelancer and Password##99
          ...          assert and verify elements in login modal dialog
          Login Freelancer KW

Mini dashboard
          [Documentation]          Assert and verify elements in the mini-dashboard container
          ...          Click on the Username to redirect user to My Profile page.
          #mini-dashboard
          #mode
          Wait Until Element Is Visible          class=MiniDashboard_miniDashboard__2g2df
          Element Should Be Visible          class=MiniDashboard_miniDashboard__2g2df
          Element Text Should Be          xpath=//h4[contains(.,'You are logged in.')]          You are logged in.
          Element Text Should Be          xpath=//h4[contains(.,'Finance')]          Finance
          Element Text Should Be          xpath=//span[contains(.,'Balance:')]          Balance:
          Element Text Should Be          xpath=//h4[contains(.,'Complete your profile')]          Complete your profile
          #Element Text Should Be          xpath=//h4[contains(.,'My Jobs')]          My Jobs
          Element Text Should Be          xpath=//h4[contains(.,'My Profile Viewers')]          My Profile Viewers
          #Element Text Should Be          xpath=//h4[contains(.,'Mode:')]          Mode:
          Capture Page Screenshot          landing-page-{index}.png
          Click Link          /profile
          Sleep          1
          Capture Page Screenshot          profile-page-{index}.png

Check required fielfs
          Wait Until Element Is Visible          link=Add a new Collection
          Click Element          link=Add a new Collection
          #manage portfolio
          Wait Until Element Is Visible          xpath=//h2[contains(text(),'Add a New Collection')]
          Element Should Be Visible          xpath=//h2[contains(text(),'Add a New Collection')]
          Element Text Should Be          xpath=//h2[contains(text(),'Add a New Collection')]          Add a New Collection
          Wait Until Element Is Visible          id=title
          Element Should Be Visible          id=title
          Element Should Be Enabled          id=title
          Wait Until Element Is Visible          id=description
          Element Should Be Visible          id=description
          Element Should Be Enabled          id=description
          Wait Until Element Is Visible          xpath=//p[contains(text(),'Add files')]
          Element Should Be Visible          xpath=//p[contains(text(),'Add files')]
          Element Should Be Enabled          xpath=//p[contains(text(),'Add files')]
          Wait Until Element Is Visible          xpath=//button[contains(.,'Add Collection')]
          Element Should Be Enabled          xpath=//button[contains(.,'Add Collection')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Cancel')]
          Element Should Be Enabled          xpath=//a[contains(text(),'Cancel')]
          #end
          Click Element          xpath=//button[contains(.,'Add Collection')]
          #*Required fields
          Wait Until Element Is Visible          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/form[1]/div[1]
          Element Should Be Visible          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/form[1]/div[1]
          Element Text Should Be          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/form[1]/div[1]          * Required
          Wait Until Element Is Visible          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/form[1]/div[2]
          Element Should Be Visible          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/form[1]/div[2]
          Element Text Should Be          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/form[1]/div[2]          * Required
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* Minimum of one image')]
          Element Should Be Visible          xpath=//div[contains(text(),'* Minimum of one image')]
          Element Text Should Be          xpath=//div[contains(text(),'* Minimum of one image')]          * Minimum of one image
          Click Element          xpath=//a[contains(text(),'Cancel')]

Create Collection add 10 items
          [Documentation]          Create new collection clicking by
          ...          Add a new Collection button
          ...          input random Title
          ...          Input random Description
          ...          attach 10 image files.
          ...          save colection
          ...          assert and verify that collection is present on the My Profile page.
          #Create Collection page
          #Create Collection
          #My Profile page
          Wait Until Element Is Visible          link=Add a new Collection
          Click Element          link=Add a new Collection
          ${number_title}          Generate Random String          1          [NUMBERS]
          ${random_title}          Generate Random String          5          [LETTERS]
          Input Text          id=title          No ${number_title} Collection ${random_title}
          Capture Page Screenshot          title-{index}.png
          #description
          ${number_description}          Generate Random String          1          [LETTERS]
          ${random_description}          Generate Random String          5          [LETTERS]
          Input Text          id=description          No ${number_description} Collection ${description1} ${random_description}
          Capture Page Screenshot          description-{index}.png
          #Action
          #1
          Scroll Element Into View          xpath=//button[contains(.,'Add Collection')]
          ${id1} =          Generate Random String          1          [NUMBERS]
          Choose File          id=fileUpload          ${CURDIR}\\random\\c3${id1}.jpg
          Sleep          1
          ${id2} =          Generate Random String          1          [NUMBERS]
          Choose File          id=fileUpload          ${CURDIR}\\random\\c3${id2}.jpg
          Sleep          1
          ${id3} =          Generate Random String          1          [NUMBERS]
          Choose File          id=fileUpload          ${CURDIR}\\random\\c2${id3}.jpg
          Sleep          1
          Scroll Element Into View          xpath=//button[contains(text(),'Add Collection')]
          ${id4} =          Generate Random String          1          [NUMBERS]
          Choose File          id=fileUpload          ${CURDIR}\\random\\c2${id4}.jpg
          Sleep          1
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Add Collection')]
          Capture Page Screenshot          bedore-save-collection-{index}.png
          Wait Until Element Is Enabled          xpath=//button[contains(text(),'Add Collection')]
          Click Element          xpath=//button[contains(text(),'Add Collection')]
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Successfully added collection')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'Successfully added collection')]
          Log To Console          ${alert}
          Capture Page Screenshot          my-profiel-{index}.png
          Click Element          xpath=//div[contains(text(),'Successfully added collection')]

Edit cancelation
          [Documentation]          Click on the edit button and go to collection
          ...          click cancel button,
          ...          verifyu and assert coresponding page.
          Capture Page Screenshot          canceling-collection-{index}.png
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Delete')]
          Element Should Be Visible          xpath=//button[contains(text(),'Delete')]
          Element Should Be Enabled          xpath=//button[contains(text(),'Delete')]
          Element Text Should Be          xpath=//button[contains(text(),'Delete')]          Delete
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Edit')]
          Element Should Be Visible          xpath=//a[contains(text(),'Edit')]
          Element Should Be Enabled          xpath=//a[contains(text(),'Edit')]
          Element Text Should Be          xpath=//a[contains(text(),'Edit')]          Edit
          Click Element          xpath=//a[contains(text(),'Edit')]
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Update Collection')]
          Scroll Element Into View          xpath=//button[contains(text(),'Update Collection')]
          Capture Page Screenshot          collection-edit-cancelation-{index}.png
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Cancel')]
          Click Element          xpath=//a[contains(text(),'Cancel')]
          Wait Until Element Is Not Visible          xpath=//a[contains(text(),'Cancel')]
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Delete')]

Go to Collection
          [Documentation]          Go to collection and Edit.
          ...          Add one file, \ alert message with the text *10 images max should be present
          ...          Delete one image.
          ...          Update collection.
          Capture Page Screenshot          may-profi;e-{index}.png
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Delete')]
          Element Should Be Visible          xpath=//button[contains(text(),'Delete')]
          Element Should Be Enabled          xpath=//button[contains(text(),'Delete')]
          Element Text Should Be          xpath=//button[contains(text(),'Delete')]          Delete
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Edit')]
          Element Should Be Visible          xpath=//a[contains(text(),'Edit')]
          Element Should Be Enabled          xpath=//a[contains(text(),'Edit')]
          Element Text Should Be          xpath=//a[contains(text(),'Edit')]          Edit
          Click Element          xpath=//a[contains(text(),'Edit')]
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Update Collection')]
          Scroll Element Into View          xpath=//button[contains(text(),'Update Collection')]
          ${id4} =          Generate Random String          1
          Choose File          id=fileUpload          ${CURDIR}\\random\\c31.jpg
          Sleep          1
          #Choose File          id=fileUpload          ${CURDIR}\\random\\c31.jpg
          Scroll Element Into View          xpath=//button[contains(text(),'Update Collection')]
          Click Element          xpath=//button[contains(text(),'Update Collection')]
          Capture Page Screenshot          10-items-{index}.png
          Wait Until Element Is Visible          xpath=//div[contains(text(),'* 10 images max')]
          Element Text Should Be          xpath=//div[contains(text(),'* 10 images max')]          * 10 images max
          Capture Element Screenshot          xpath=//div[contains(text(),'* 10 images max')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'* 10 images max')]
          Log To Console          ${alert}
          Sleep          1
          Click Element          xpath=//body/div[@id='root']/div[1]/section[1]/div[2]/form[1]/div[1]/div[9]/div[1]/div[1]/i[1]
          Capture Page Screenshot          delete-one-item-{index}.png
          Wait Until Element Is Not Visible          xpath=//div[contains(text(),'* 10 images max')]
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Update Collection')]
          Capture Element Screenshot          xpath=//button[contains(text(),'Update Collection')]
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Cancel')]
          Click Element          xpath=//button[contains(text(),'Update Collection')]
          Capture Page Screenshot          save-collection-{index}.png
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Successfully updated collection')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'Successfully updated collection')]
          Log To Console          ${alert}
          Click Element          xpath=//div[contains(text(),'Successfully updated collection')]

Create 6 collections
          Capture Page Screenshot          2nd-collection-{index}.png
          Create collection KW
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Successfully added collection')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'Successfully added collection')]
          Log To Console          ${alert}
          Capture Page Screenshot          3rd-collection-{index}.png
          Click Element          xpath=//div[contains(text(),'Successfully added collection')]
          Create collection KW
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Successfully added collection')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'Successfully added collection')]
          Log To Console          ${alert}
          Capture Page Screenshot          4th-collection-{index}.png
          Click Element          xpath=//div[contains(text(),'Successfully added collection')]
          Create collection KW
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Successfully added collection')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'Successfully added collection')]
          Log To Console          ${alert}
          Capture Page Screenshot          5th-collection-{index}.png
          Click Element          xpath=//div[contains(text(),'Successfully added collection')]
          Create collection KW
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Successfully added collection')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'Successfully added collection')]
          Log To Console          ${alert}
          Capture Page Screenshot          6th-collection-{index}.png
          Click Element          xpath=//div[contains(text(),'Successfully added collection')]
          Scroll Element Into View          xpath=//div[1]/div[1]/div[1]/div[1]/div[2]/div[5]/div[1]/div[2]/a[1]
          Create collection KW
          Wait Until Element Is Visible          xpath=//div[contains(text(),'Successfully added collection')]
          ${alert} =          Get Text          xpath=//div[contains(text(),'Successfully added collection')]
          Log To Console          ${alert}
          Capture Page Screenshot          6th-collection-{index}.png
          Click Element          xpath=//div[contains(text(),'Successfully added collection')]

Delete Collections
          [Documentation]          In this case we are delete all Collection
          ...          Verify and assert all elements in the delete modal dialog
          ...          Use Delete Collection KW to delete one collection.
          #Delete Collection KW
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Delete')]
          Element Should Be Visible          xpath=//button[contains(text(),'Delete')]
          Element Should Be Enabled          xpath=//button[contains(text(),'Delete')]
          Element Text Should Be          xpath=//button[contains(text(),'Delete')]          Delete
          Wait Until Element Is Visible          xpath=//a[contains(text(),'Edit')]
          Element Should Be Visible          xpath=//a[contains(text(),'Edit')]
          Element Should Be Enabled          xpath=//a[contains(text(),'Edit')]
          Element Text Should Be          xpath=//a[contains(text(),'Edit')]          Edit
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Delete')]
          Click Element          xpath=//button[contains(text(),'Delete')]
          Capture Page Screenshot          delete-modal-dialog-{index}.png
          #collection delete modal
          Delete Collection Modal Dialog
          Wait Until Element Is Visible          xpath=//button[contains(text(),'Delete')]
          Click Element          id=deleteCollectionButton
          #Click Element
          Sleep          2
          Capture Page Screenshot          delete-collection-{index}.png
          Delete Collection KW
          Sleep          2
          Delete Collection KW
          Sleep          2
          Delete Collection KW
          Sleep          2
          Delete Collection KW
          Sleep          2
          Delete Collection KW

Logout
          [Documentation]          in this case we are tesitig
          ...          - Logout user
          ...          - Assert and verify delete modal dialog
          LogoutKW
