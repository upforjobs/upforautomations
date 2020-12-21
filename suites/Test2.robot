*** Settings ***
Library           Collections
Library           RequestsLibrary
Resource          _mysetup.txt

*** Test Cases ***
admin.users
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /users
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.create_users
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /users/create
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.deactivate_users
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /users/deactivated
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.clinics
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /admin/clinics
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.clinics_create
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /admin/clinics/create
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.specialties
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /settings/specialities
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.certifications
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /settings/certifications
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.departments
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /settings/departments
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.wallet_request
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /wallet/requests
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.translation_fees
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /translation_fees
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8

admin.showdrawup
    create session    get_doctors_details    ${TESTURL}
    ${response}=    get request    get_doctors_details    /reports/showdrawup
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${actual_code} =    Convert To String    ${response.status_code}
    Should Be Equal    ${actual_code}    200
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type_value}    text/html; charset=UTF-8
