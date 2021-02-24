*** Settings ***
Library                 Collections
Library                 RequestsLibrary
Resource                _mysetup.txt
Library                 SeleniumLibrary

*** Test Cases ***
go to
          ${LOG_FILE}

forgot password
          [Tags]          api
          create session          get_forgot_password_details          ${TESTURL}
          ${response}=          get request          get_forgot_password_details          /password/reset
          Log To Console          ${response.status_code}
          #Log To Console          ${response.content}
          #Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

registration
          [Tags]          api
          create session          get_registration_details          ${TESTURL}
          ${response}=          get request          get_registration_details          /register
          Log To Console          ${response.status_code}
          #Log To Console          ${response.content}
          #Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.account_manager
          create session          get_homepage_account_manager_details          ${TESTURL}
          ${response}=          get request          get_homepage_account_manager_details          /account_manager
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.list_patients
          create session          get_list_patients_details          ${TESTURL}
          ${response}=          get request          get_list_patients_details          /list_patients
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.appointments
          create session          get_appointments_details          ${TESTURL}
          ${response}=          get request          get_appointments_details          /appointments
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.doctors
          create session          get_doctors_details          ${TESTURL}
          ${response}=          get request          get_doctors_details          /doctors
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.wallet
          create session          get_wallet_details          ${TESTURL}
          ${response}=          get request          get_wallet_details          /wallet
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.transfer_money
          create session          get_transfer_money_details          ${TESTURL}
          ${response}=          get request          get_transfer_money_details          /transfer_money
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.profile
          create session          get_profile_details          ${TESTURL}
          ${response}=          get request          get_profile_details          /profile
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.reports_payment
          create session          get_reports_payment_details          ${TESTURL}
          ${response}=          get request          get_reports_payment_details          /reports/payment
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.reports_login_history
          create session          get_reports_login_details          ${TESTURL}
          ${response}=          get request          get_reports_login_details          /reports/login_history
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.help_list
          create session          get_help_list_details          ${TESTURL}
          ${response}=          get request          get_help_list_details          /help_list
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8

account_manager.system_check
          create session          get_system_check_details          ${TESTURL}
          ${response}=          get request          get_system_check_details          /syscheck
          Log To Console          ${response.status_code}
          Log To Console          ${response.content}
          Log To Console          ${response.headers}
          ${actual_code} =          Convert To String          ${response.status_code}
          Should Be Equal          ${actual_code}          200
          ${content_type_value}=          Get From Dictionary          ${response.headers}          Content-Type
          Should Be Equal          ${content_type_value}          text/html; charset=UTF-8
