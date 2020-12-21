*** Settings ***
Library           Collections
Resource          _mysetup.txt
Library           RequestsLibrary

*** Variable ***
${bearerToken}    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjYzZTdkYWNmYzU1MzczYTY3YWViMDM3ZjM3ODY1YzAwNzNjNTYzZjNmOWY2NWNhNGMzNzQzNzNjOGJmZjFiOTJiMWM3NjRlYWYxZjc1MDRlIn0.eyJhdWQiOiIxIiwianRpIjoiNjNlN2RhY2ZjNTUzNzNhNjdhZWIwMzdmMzc4NjVjMDA3M2M1NjNmM2Y5ZjY1Y2E0YzM3NDM3M2M4YmZmMWI5MmIxYzc2NGVhZjFmNzUwNGUiLCJpYXQiOjE1NzIyNzM5MzQsIm5iZiI6MTU3MjI3MzkzNCwiZXhwIjoxNjAzODk2MzM0LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.mLZKTNJ3EDC8UlKcn6NuWtaj7EEXMabxt9C26Ox5dD-cr--wqvggSndqr8FsblW03mrrPaik9k5Cfa_9bnOvIBziXVzR56we7mBuS9WTH0XX1b3EfMpQgps5U3YelERUu5Wce_Dwaal2C9J0phpnCwCagGqnwjJpDxHyuGYc9UZ_AYd0lM8qWQVQI8_PfxcXDL9Y2HIhv15V0e_O9aLbmsugqesdO-fwzi1HEaWch9VgY45rvswW7cZErcNbZ8CUtjVD71Na85Wdc3FTbijzjiVwbliqHEs481l0MdQnhhUoroiaiPZB4xYFUjxFzPs8OJwdxuxnbEcxm6R_BP65Gr8wa-SUCtAMcmtXB6j4RQINwv4_zzfGEWyP7alpch1fCGYfhNFyHh9JKk4PDBOiHkbc7LVnotBo-godKX505p5rB_PEKRAMeYqqZUWw0bcyweFokN33gEJUgfUJg9jIIi0MzCEk8pJD29NYCcHBlC0Kt3CMSfc5bfZN_VkJymc3IrMTAdR7Ze1smyMAz-KVHdyxvJqJETntMyZa4SrJpAaOvAYjmzZOYlpX9VFbK-rwdZP2pQRzgNmIRVL6V9v_a9U94UaYxDc_H99_AEnVa84bbibP2cz2nECQ7dyjmO-WM0KRc3rhcOBxyCuMLwAVoxmtiXrPLZihy-9_K3lVgQI"

*** Test Cases ***
login
    [Tags]    api
    create session    get_login_details    ${TESTURL}
    ${response}=    get request    get_login_details    api/specialityListApi/
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

forgot password
    [Tags]    api
    create session    get_forgot_password_details    ${TESTURL}
    ${response}=    get request    get_forgot_password_details    /password/reset
    Log To Console    ${response.status_code}
    #Log To Console    ${response.content}
    #Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

registration
    [Tags]    api
    create session    get_registration_details    ${TESTURL}
    ${response}=    get request    get_registration_details    /register
    Log To Console    ${response.status_code}
    #Log To Console    ${response.content}
    #Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.doctors
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /doctors
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    #Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.doctors_appointment
    create session    get_doctors_appointment_details    ${TESTURL}
    ${response}=    get request    get_doctors_appointment_details    /doctors/2/direct_appointment
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    #Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.profile
    create session    get_profile_details    ${TESTURL}
    ${response}=    get request    get_profile_details    /profile
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.patient_data_patient_history
    create session    get_patient_data_patient_history_details    ${TESTURL}
    ${response}=    get request    get_patient_data_patient_history_details    /profile/patientdata/patient_history
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.patient_data_patient_documentation
    create session    get_patient_data_patient_documentation_details    ${TESTURL}
    ${response}=    get request    get_patient_data_patient_documentation_details    /profile/patientdata/patient_documentation
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.wallet
    create session    get_wallet_details    ${TESTURL}
    ${response}=    get request    get_wallet_details    /wallet
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.payment
    create session    get_payment_details    ${TESTURL}
    ${response}=    get request    get_payment_details    /reports/payment
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.login_history
    create session    get_loginistory_details    ${TESTURL}
    ${response}=    get request    get_loginistory_details    /reports/login_history
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.recommendations
    create session    get_recommendations_details    ${TESTURL}
    ${response}=    get request    get_recommendations_details    /recommendation_patient
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.helplist
    create session    get_helplist_details    ${TESTURL}
    ${response}=    get request    get_helplist_details    /help_list
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

patient.syscheck
    create session    get_syscheck_details    ${TESTURL}
    ${response}=    get request    get_syscheck_details    /syscheck
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8
