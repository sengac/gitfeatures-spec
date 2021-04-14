Feature: Load / Clone / Init

  # Rule: Must render what is in localStorage for the URL
  
  Scenario: Valid URL given for something that exists in localStorage
    Given a user wants to load a project already in localStorage
    When the user enters a URL that matches
    Then the system renders what is in localStorage
    
  # Rule: Must show a template stub if not in localStorage
  
  Scenario: Valid URL given that hasn't been cloned or initialized
    Given a user wants to clone, load or create something that isn't in localStorage
    When the user enters a URL that is not in localStorage
    Then the template stub is rendered
    And the clone/init modal is displayed after a short delay

  # Rule: Must elegantly handle render/deserialize failures
  
  Scenario: Parsing broken JSON causes error
    Given a user wants to load an existing project in localStorage
    And the project in localStorage has a JSON error
    When the user enters a valid URL to bring up this project
    Then the system displays an error
    And renders the stub template
    And displays the clone/init modal aftewards

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