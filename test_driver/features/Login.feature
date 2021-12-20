Feature: Main Screen Validates and then Logins and Checks if each product clicks are ok

    Scenario: Validates the email when text is entered
        Given I have "emailfield" and "passfield" and "LoginButton"
        When I fill the "emailfield" field with "youremail@gmail.com"
        Then I pause for 2 seconds
        And I fill the "passfield" field with "somewrongpassword@"
        Then I pause for 2 seconds
        Then I tap the "LoginButton" button
        Then I have "HomePage" on screen
        Then I pause for 3 seconds
