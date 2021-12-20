Feature: Main Screen Validates and then Logins and Checks if each product clicks are ok

    Scenario: Favourite Page
        Then I tap "FavouratePage" page
        Then I pause for 3 seconds
        Then I tap "ProductPage" page
        Then I tap "like0" button
        Then I pause for 3 seconds 
        Then I tap "FavouratePage" page
