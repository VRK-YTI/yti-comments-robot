*** Variables ***
${BROWSER}        chrome
${ENVIRONMENT_URL}    https://kommentit-dev.suomi.fi/
${IMPERSONATE_USER_DROPDOWN}    id=impersonate_user_link
${ADMIN_USER_ID}    id=testiadmin@localhost
${ADMIN_USER_NAME}    Testi Admin
${SUPER_USER_ID}    id=testisuperuser@localhost
${SUPER_USER_NAME}    Testi Superuser
${LANGUAGE_EN}    id=en
${LANGUAGE_FI}    id=fi
${LANGUAGE_SV}    På svenska (SV)
${REGISTRY_1}     Testirekisteri
${REGISTRY_2}     Automaatiorekisteri
${ORGANIZATION_1}    Testiorganisaatio
${CONTENT_LANGUAGE_EN}    id=en_content_lang_dropdown_button
${2_BREADCRUMB_LINK}    id=2_breadcrumb_link
${3_BREADCRUMB_LINK}    id=3_breadcrumb_link
#Frontpage buttons
${USER_RIGHT_MANAGEMENT}    id=navigation_groupmanagement_link
${LANGUAGE_DROPDOWN_BTN}    id=select_lang_dropdown
${STATUS_DROPDOWN_BTN}    id=selected_status_filter_dropdown
${SEARCH_CODE_CHECKBOX}    id=search_code_details_checkbox
${FRONTPAGE_LINK}    id=main_page_link
${NAVIGATION_MENU_DDL}    id=navigation_menu_dropdown
${NAVIGATION_MENU_REGISTRIES}    id=navigation_link_registries
${REGISTRY_FILTER_DDL}    id=selected_registry_filter_dropdown
${SEARCH_BOX_INPUT}    id=search_box_input
${INFORMATION_LINK}    id=information_link
${NAVIGATION_MENU_USER_DETAILS}    id=navigation_link_user_details
${LICENSE_LINK}    id=license_link
${DESCRIPTION_OF_FILE_LINK}    id=description_of_file_link
#Status
${STATUS_DRAFT_FI}    Luonnos
${STATUS_VALID_FI}    Voimassa oleva
${ALL_STATUSES_FI}    Kaikki tilat
${DRAFT_STATUS}    id=DRAFT_status_input_dropdown
${VALID_STATUS}    id=VALID_status_input_dropdown

*** Keywords ***
Test Case Setup Admin
    Open Comments
    Set Selenium Speed    0.5
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}

Test Case Setup Superuser
    Open Comments
    Set Selenium Speed    0.5
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}

Select user
    [Arguments]    ${user_id}    ${user_name}
    Wait until page contains element    ${IMPERSONATE_USER_DROPDOWN}    timeout=30
    Click element    ${IMPERSONATE_USER_DROPDOWN}
    Wait until page contains element    ${user_id}    timeout=30
    Click element    ${user_id}
    Wait Until Page Contains    ${user_name}    timeout=60
    Sleep    1

Open Comments
    Open Browser with Settings
    Wait until page contains    Kommentit    timeout=60
    Wait until page contains    KIRJAUDU SISÄÄN    timeout=60

Open Browser with Settings
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Open Chrome to Environment
    ...    ELSE IF    '${BROWSER}' == 'chrome-local'    Open Chrome to Environment
    ...    ELSE    Open Browser    ${ENVIRONMENT_URL}    browser=${BROWSER}

Open Chrome to Environment
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Run Keyword If    '${BROWSER}' == 'chrome-jenkins'    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${ENVIRONMENT_URL}

Return to Comments frontpage
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=60
    Click element    ${FRONTPAGE_LINK}
    Sleep    1
