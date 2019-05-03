*** Settings ***
Documentation     Test Suite for creating comment round
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Library           Collections
Resource          resources/Generic_resources.robot
Resource          resources/Reference_Data_resources.robot
Resource          resources/Terminologies_resources.robot
Resource          resources/Data_Vocabularies_resources.robot

*** Test Cases ***
200. Create new comment round for code list
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

201. Create new comment round for terminology
    [Documentation]    Create new terminology with concepts in Terminologies tool and create new comment round for the terminology.
    ...    Delete terminology and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Terminology
    Create Comment Round    ${TERMINOLOGIES_TOOL}    Testiautomaatiosanasto    Testiautomaatiokierros    kuvaus    False
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Terminology    Testiautomaatiokierros

202. Create new comment round for profile
    [Documentation]    Create new profile in Data Vocabularies tool and create new comment round for the profile.
    ...    Delete profile and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Data Vocabularies
    Create Comment Round    ${DATA_VOCABULARIES_TOOL}    Testiautomaatio    Testiautomaatiokierros    kuvaus    False
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Data Vocabularies    Testiautomaatiokierros

203. Add resources from Reference Data for comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new codes for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

204. Add resources from Terminologies for comment round
    [Documentation]    Create new terminology with concepts in Terminologies tool and create new comment round
    ...    for the terminology. Add new concepts for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Terminology
    Create Comment Round    ${TERMINOLOGIES_TOOL}    Testiautomaatiosanasto    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Saturnus    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${RETIRED_0}
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Terminology    Testiautomaatiokierros

205. Add resources from Data Vocabularies for comment round
    [Documentation]    Create new profile in Data Vocabularies tool and create new comment round for the profile.
    ...    Add new class for comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Data Vocabularies With New Class
    Create Comment Round    ${DATA_VOCABULARIES_TOOL}    Testiautomaatio    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Automobiili    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${SUPERSEDED_0}
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Data Vocabularies    Testiautomaatiokierros

206. Add new resources from Reference Data for comment round after comment round has started
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code for commenting, start comment round and add new code for commenting after comment
    ...    round has started. Close comment round and delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    True
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round
    Add Resource For Comment Round    Testcode 57    ${COMMENT_TEXT_INPUT_1}    kommentti22    ${EMPTY}    ${EMPTY}
    Close Comment Round
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

207. Send comment for Reference Data resource
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code for commenting, select another user and send comment.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Comment On Resource    ${COMMENT_TEXT_INPUT_0}    Ehdotetaan uutta tilaa    ${STATUS_DDL_0}    ${SUPERSEDED_0}
    Wait Until Page Contains    Ehdotetaan uutta tilaa    timeout=20
    Wait Until Page Contains    Korvattu    timeout=20
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

208. Remove Reference Data resources from comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new codes for commenting, remove selected codes from comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Add Resource For Comment Round    Testcode 30    ${COMMENT_TEXT_INPUT_1}    kommentti2    ${STATUS_DDL_1}    ${VALID_1}
    Add Resource For Comment Round    Testcode 35    ${COMMENT_TEXT_INPUT_2}    kommentti3    ${STATUS_DDL_2}    ${VALID_2}
    Wait Until Page Contains Element    ${EDIT_COMMENTROUND}    timeout=20
    Click Element    ${EDIT_COMMENTROUND}
    Wait Until Page Contains Element    ${REMOVE_COMMENT_THREAD_0_BTN}    timeout=20
    Click Element    ${REMOVE_COMMENT_THREAD_0_BTN}
    Log To Console    First resource removed
    Wait Until Page Contains Element    ${REMOVE_COMMENT_THREAD_0_BTN}    timeout=20
    Click Element    ${REMOVE_COMMENT_THREAD_0_BTN}
    Log To Console    Second resource removed
    Wait Until Page Contains Element    ${REMOVE_COMMENT_THREAD_0_BTN}    timeout=20
    Click Element    ${REMOVE_COMMENT_THREAD_0_BTN}
    Log To Console    Third resource removed
    Wait Until Page Contains Element    ${SAVE_COMMENTROUND}    timeout=20
    Click Element    ${SAVE_COMMENTROUND}
    Wait Until Element Is Visible    ${EDIT_COMMENTROUND}    timeout=30
    Page Should Not Contain    Testcode 28
    Page Should Not Contain    Testcode 30
    Page Should Not Contain    Testcode 35
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

209. Add Reference Data resource without prefLabel to comment round
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add new code without prefLabel for commenting, delete code list and comment round.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data And Code Without prefLabel
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    http://uri.suomi.fi/codelist/test/6000/code/testcode40    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Wait Until Page Contains    kommentti1    timeout=20
    Wait Until Page Contains Element    //*[contains(text(), "http://uri.suomi.fi/codelist/test/6000/code/testcode40")]    timeout=60
    Click Element    //*[contains(text(), "http://uri.suomi.fi/codelist/test/6000/code/testcode40")]
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://kommentit-dev.suomi.fi/"    Select Window    title=DEV - Koodistot
    ...    ELSE    Select Window    title=TEST - Koodistot
    Wait Until Page Contains    koodisto6000    timeout=20
    Wait Until Page Contains    testcode40    timeout=20
    Close Window
    Run Keyword If    "${ENVIRONMENT_URL}" == "https://kommentit-dev.suomi.fi/"    Select Window    title=DEV - Kommentit
    ...    ELSE    Select Window    title=TEST - Kommentit
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

210. Check comment round results
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add resources for commenting, send comments from three users and check comment round results.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Reference Data
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Add Resource For Comment Round    Testcode 30    ${COMMENT_TEXT_INPUT_1}    kommentti2    ${STATUS_DDL_1}    ${VALID_1}
    Start Comment Round
    Wait Until Element Is Visible    ${COMMENTS_TAB}    timeout=30
    Click Element    ${COMMENTS_TAB}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Click Element    ${START_COMMENTING_BTN}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_0}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_0}    Kommentti 1
    Wait until page contains element    ${STATUS_DDL_0}    timeout=30
    Click element    ${STATUS_DDL_0}
    Wait until page contains element    ${SUPERSEDED_0}    timeout=30
    Click Element    ${SUPERSEDED_0}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_1}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_1}    Kommentti 2
    Wait until page contains element    ${STATUS_DDL_1}    timeout=30
    Click element    ${STATUS_DDL_1}
    Wait until page contains element    ${VALID_1}    timeout=30
    Click Element    ${VALID_1}
    Wait until page contains element    ${SEND_COMMENTS_BTN_BOTTOM}    timeout=30
    Click Element    ${SEND_COMMENTS_BTN_BOTTOM}
    Wait until element is visible    ${START_COMMENTING_BTN}    timeout=30
    Log To Console    First commenter's comments added
    Select user    ${TESTGROUP_USER_ID}    ${TESTGROUP_USER_NAME}
    Wait Until Element Is Visible    ${COMMENTS_TAB}    timeout=30
    Click Element    ${COMMENTS_TAB}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Click Element    ${START_COMMENTING_BTN}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_0}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_0}    Kommentti 3
    Wait until page contains element    ${STATUS_DDL_0}    timeout=30
    Click element    ${STATUS_DDL_0}
    Wait until page contains element    ${INVALID_0}    timeout=30
    Click Element    ${INVALID_0}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_1}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_1}    Kommentti 4
    Wait until page contains element    ${STATUS_DDL_1}    timeout=30
    Click element    ${STATUS_DDL_1}
    Wait until page contains element    ${VALID_1}    timeout=30
    Click Element    ${VALID_1}
    Wait until page contains element    ${SEND_COMMENTS_BTN_BOTTOM}    timeout=30
    Click Element    ${SEND_COMMENTS_BTN_BOTTOM}
    Wait until element is visible    ${START_COMMENTING_BTN}    timeout=30
    Log To Console    Second commenter's comments added
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Wait Until Element Is Visible    ${COMMENTS_TAB}    timeout=30
    Click Element    ${COMMENTS_TAB}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Click Element    ${START_COMMENTING_BTN}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_0}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_0}    Kommentti 5
    Wait until page contains element    ${STATUS_DDL_0}    timeout=30
    Click element    ${STATUS_DDL_0}
    Wait until page contains element    ${INVALID_0}    timeout=30
    Click Element    ${INVALID_0}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_1}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_1}    Kommentti 6
    Wait until page contains element    ${STATUS_DDL_1}    timeout=30
    Click element    ${STATUS_DDL_1}
    Wait until page contains element    ${VALID_1}    timeout=30
    Click Element    ${VALID_1}
    Wait until page contains element    ${SEND_COMMENTS_BTN_BOTTOM}    timeout=30
    Click Element    ${SEND_COMMENTS_BTN_BOTTOM}
    Wait until element is visible    ${START_COMMENTING_BTN}    timeout=30
    Log To Console    Third commenter's comments added
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Close Comment Round
    Sleep    1
    Wait Until Page Contains    Korvattu:    timeout=20
    Wait Until Page Contains    (33.33 %)    timeout=20
    Wait Until Page Contains    Virheellinen:    timeout=20
    Wait Until Page Contains    (66.67 %)    timeout=20
    Wait Until Page Contains    Voimassa oleva:    timeout=20
    Wait Until Page Contains    (100.00 %)    timeout=20
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros

211. Send inline comment for resource
    [Documentation]    Import new code list in Reference Data tool and create new comment round for the code list.
    ...    Add resources for commenting, send comments from two users and inline comment from one user.
    [Tags]    comments
    [Setup]    Test Case Setup Reference Data
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Create Comment Round    ${REFERENCE_DATA_TOOL}    koodisto6000    Testiautomaatiokierros    kuvaus    False
    Add Resource For Comment Round    Testcode 28    ${COMMENT_TEXT_INPUT_0}    kommentti1    ${STATUS_DDL_0}    ${VALID_0}
    Start Comment Round
    Wait Until Element Is Visible    ${COMMENTS_TAB}    timeout=30
    Click Element    ${COMMENTS_TAB}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Click Element    ${START_COMMENTING_BTN}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_0}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_0}    Kommentti 1
    Wait until page contains element    ${STATUS_DDL_0}    timeout=30
    Click element    ${STATUS_DDL_0}
    Wait until page contains element    ${SUPERSEDED_0}    timeout=30
    Click Element    ${SUPERSEDED_0}
    Wait until page contains element    ${SEND_COMMENTS_BTN_BOTTOM}    timeout=30
    Click Element    ${SEND_COMMENTS_BTN_BOTTOM}
    Wait until element is visible    ${START_COMMENTING_BTN}    timeout=30
    Log To Console    First commenter's comments added
    Select user    ${TESTGROUP_USER_ID}    ${TESTGROUP_USER_NAME}
    Wait Until Element Is Visible    ${COMMENTS_TAB}    timeout=30
    Click Element    ${COMMENTS_TAB}
    Wait Until Element Is Visible    ${START_COMMENTING_BTN}    timeout=30
    Click Element    ${START_COMMENTING_BTN}
    Wait until page contains element    ${COMMENT_TEXT_INPUT_0}    timeout=30
    Input Text    ${COMMENT_TEXT_INPUT_0}    Kommentti 3
    Wait until page contains element    ${STATUS_DDL_0}    timeout=30
    Click element    ${STATUS_DDL_0}
    Wait until page contains element    ${INVALID_0}    timeout=30
    Click Element    ${INVALID_0}
    Wait until page contains element    ${SEND_COMMENTS_BTN_BOTTOM}    timeout=30
    Click Element    ${SEND_COMMENTS_BTN_BOTTOM}
    Wait until element is visible    ${START_COMMENTING_BTN}    timeout=30
    Log To Console    Second commenter's comments added
    Select user    ${ADMIN_USER_ID}    ${ADMIN_USER_NAME}
    Wait Until Element Is Visible    ${RESOURCES_TAB}    timeout=30
    Click Element    ${RESOURCES_TAB}
    Wait Until Element Is Visible    ${VIEW_COMMENT_BUBLE_0}    timeout=30
    Click Element    ${VIEW_COMMENT_BUBLE_0}
    ${elements} =    Get WebElements    //app-hierarchical-comment
    ${element} =    Get From List    ${elements}    0
    ${elementId} =    Set Variable    ${element.get_attribute('id')}
    Wait Until Element Is Visible    ${INLINE_COMMENT_PREFIX}${elementId}${INLINE_REPLY_BTN_SUFFIX}    timeout=30
    Click Element    ${INLINE_COMMENT_PREFIX}${elementId}${INLINE_REPLY_BTN_SUFFIX}
    Wait Until Element Is Visible    ${INLINE_COMMENT_PREFIX}${elementId}${INLINE_REPLY_INPUT_SUFFIX}    timeout=30
    Click Element    ${INLINE_COMMENT_PREFIX}${elementId}${INLINE_REPLY_INPUT_SUFFIX}
    Input Text    ${INLINE_COMMENT_PREFIX}${elementId}${INLINE_REPLY_INPUT_SUFFIX}    Inline kommentti 1
    Wait Until Element Is Visible    ${INLINE_COMMENT_PREFIX}${elementId}${INLINE_SEND_REPLY_BTN_SUFFIX}    timeout=30
    Click Element    ${INLINE_COMMENT_PREFIX}${elementId}${INLINE_SEND_REPLY_BTN_SUFFIX}
    Wait Until Page Contains    Inline kommentti 1    timeout=20
    Capture Page Screenshot
    Wait Until Element Is Visible    ${CLOSE_INLINE_COMMENT_BUTTON}    timeout=30
    Click Element    ${CLOSE_INLINE_COMMENT_BUTTON}
    Page Should Not Contain    Inline kommentti 1    timeout=20
    Return To Comments Frontpage
    [Teardown]    Test Case Teardown Reference Data    Testiautomaatiokierros
