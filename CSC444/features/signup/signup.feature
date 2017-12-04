Feature: As an individual who wants to create a new account, 
  I should be able to do so by filling in info that cooresponds to me,
  any field that is left blank or is incorrect in format should be flagged and should not allow me to continue
  
Scenario: A signup for a new account
  Given that I am on the homepage
  And I see the signup button 
  When I click on the signup button
  Then I should see the form to enter a username
  When I enter a username, bo, that has less than three characters 
  Then I should see a error message to create a username with more than three characters
  