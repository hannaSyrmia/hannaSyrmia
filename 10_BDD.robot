*** Settings ***
Documentation    BDD
Metadata         ID                           10
Metadata         Automation priority          1
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
BDD
    [Documentation]    BDD

    Given calculator has been cleared
    When user types "1 + 3"
    And user pushes equals
    Then result is "4"


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_10_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_10_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =       Get Variable Value    ${TEST_SETUP}
    ${TEST_10_SETUP_VALUE} =    Get Variable Value    ${TEST_10_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_10_SETUP_VALUE is not None
        Run Keyword    ${TEST_10_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_10_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_10_TEARDOWN}.

    ${TEST_10_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_10_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =       Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_10_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_10_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
