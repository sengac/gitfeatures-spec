Feature: Load / Clone / Init

  # --- CHANGE A REPO URL TO CLONE, CREATE OR LOAD ---

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
    Given a user wants to load an existing project from localStorage
    And the project in localStorage has a JSON error
    When the user enters a valid URL to bring up this project
    Then the system displays an error
    And renders the stub template
    And displays the clone/init modal aftewards
    
  Scenario: Reading document causes error
    Given a user wants to load an existing project from localStorage
    And the project in localStorage contains a parsing error in the specification.yml file
    When the user enters a valid URL to bring up this project
    Then the system displays an error
    And renders the stub template
    And displays the clone/init modal afterwards
    
  # Rule: Must render template stub if not in localStorage
  
  Scenario: URL that hasn't been cloned
    Given a user wants to enter a URL that isn't in localStorage
    When the user changes the URL
    Then the system renders the stub template

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
    
  # Rule: View clone/init modal after stub rendered was not found
  
  Scenario: Valid URL given that hasn't been cloned or initialized
    Given a user wants to enter a URL that isn't in localStorage
    When the user changes the URL
    Then the system renders the stub template
    And the system displays the clone/init modal shortly after
    
  # --- SHOW A CLONE / INIT MODAL ---
  
  # Rule: Must be able to change URL and retry load
  
  Scenario: URL has small typo in it that needs fixing to load
    Given a user wanted to load a URL that is in localStorage
    But the user had a typo in the URL
    When the user is at the clone/init modal
    And the user fixes the URL
    And the user clicks the reload button
    Then the system renders the fixed URL from localStorage
    
  # Rule: Must have a URL to clone or initialize with
  
  Scenario: Display input area for URL
    Given a user wants to create a new project
    And the clone/init modal is being displayed to the user
    When the user wishes to change the URL for this project
    Then the user can edit the URL input field
    
  # Rule: Must have ability to choose Git credentials
  
  Scenario: Dropdown list with default credentials selected
    Given a user wants to select custom credentials
    When the user clicks on the credentials dropdown list
    Then their custom credentials should be displayed
    And the custom credentials can be selected
    
  # Rule: Must have ability to edit credentials
  
  Scenario: Button to edit credentials
    Given a user wants to edit or add git credentials
    When the user clicks the edit credentials button
    Then the clone/init modal is closed
    And the git credentials modal is opened
    And the clone/init modal is opened again once the credentials modal is closed
    
  # Rule: Must be prompted to make a choice
  
  Scenario: Button appears to clone or initialize
    Given a user wants to clone or intialize a project
    When the user enters a URL that is not in localStorage
    Then the clone/init modal appears
    And a button for "clone" can be selected
    And a button for "initialize" can be selected
    
  # Rule: Must be told what clone and init do
  
  Scenario: Explanation of what "initialize" does
    Given a user wants to clone or initialize a project
    When the user is at the clone/init modal
    Then the user should see an explanation of clone beside the clone button
    And the user should see and explanation of init beside the init button
    
  # Rule: Must know the branch to use
  
  Scenario: Clone a repository with master branch
    Given a user wants to clone a project that has a master branch
    When the user clones the project using the "master" branch
    Then the document can be rendered
    
  Scenario: Clone a repository with a main branch using master
    Given a user wants to clone a project that has a main branch
    When the user clones the project using the "master" branch
    Then the document cannot be rendered
    
  # Rule: Must not be able to cancel modal
  
  Scenario: No cross at the top of the screen
    Given a user enters a URL that is not in localStorage
    When the user is shown the clone/init modal
    Then the user cannot close the modal with a close button
  
  Scenario: Esc key is disabled
    Given a user enters a URL that is not in localStorage
    When the user is shown the clone/init modal
    Then the user cannot use the escape key to close the modal