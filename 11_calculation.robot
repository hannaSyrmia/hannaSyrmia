*** Settings ***
Documentation    calculation
Metadata         ID                           11
Metadata         Reference                    gherkin.robot
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
calculation
    [Documentation]    calculation


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_11_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_11_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =       Get Variable Value    ${TEST_SETUP}
    ${TEST_11_SETUP_VALUE} =    Get Variable Value    ${TEST_11_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_11_SETUP_VALUE is not None
        Run Keyword    ${TEST_11_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_11_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_11_TEARDOWN}.

    ${TEST_11_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_11_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =       Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_11_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_11_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
