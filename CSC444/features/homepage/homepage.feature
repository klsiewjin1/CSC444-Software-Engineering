Feature: A individual who is visiting the homepage when they are not logged in should see the following things,
  the navbar which has the following items:
    'Home', 'My Jobs', 'Browse', 'Login'
    
  the title as well as the three main subtitles:
    'Teender', 'Fast', 'Reliable', 'Easy'
    
  Finally, a link where new users are able to sign up:
    'New User? Sign up'
    
Scenario: Homepage when not logged in should be displaying information as expected
  Given I am not logged in
  And I am on the homepage
  Then I should see the navbar
  Then I should see the title and subtitles
  Then I should be able to login
    