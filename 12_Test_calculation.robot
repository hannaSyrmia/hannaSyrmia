*** Settings ***
Documentation    Test calculation
Metadata         ID                           12
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Test calculation
    [Documentation]    Test calculation


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_12_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_12_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =       Get Variable Value    ${TEST_SETUP}
    ${TEST_12_SETUP_VALUE} =    Get Variable Value    ${TEST_12_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_12_SETUP_VALUE is not None
        Run Keyword    ${TEST_12_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_12_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_12_TEARDOWN}.

    ${TEST_12_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_12_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =       Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_12_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_12_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
