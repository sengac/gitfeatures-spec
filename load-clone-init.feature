Feature: Load / Clone / Init

  # Rule: Must render what is in localStorage for the URL
  
  Scenario: Valid URL given for something that exists in localStorage
    Given a user wants to load a project already in localStorage
    When the user enters a URL that matches
    Then the system renders what is in localStorage

  # Rule: Must validate the URL before doing anything

  Scenario: URL is pttp://myfakeurl.com/fakeproject.git
    Given a user wants to clone a project
    When the user enters the URL as "pttp://myfakeurl.com/fakeproject.git"
    Then the system shows a URL validation error
  
  Scenario: URL is https://github.com/sengac/gitfeatures-spec.git
    Given a user wants to clone a project
    When the user enters the URL as "https://github.com/sengac/gitfeatures-spec.git"
    Then the system clones the URL
    And renders the URL