Feature: Main Screen Validates and then Logins and Checks if each product clicks are ok

    Scenario: Check the list
        When I tap "thumb_up3" button 10 times
        Then I expect the "claps3" to be "👏 110.0"
