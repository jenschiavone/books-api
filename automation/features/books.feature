Feature: Books tests

  Scenario: Get books
    When I make a call to the Books API
    Then I should get a successful response

  Scenario: Get Hardcover Fiction books
    Given there is a list of hardcover fiction books
    When I make a request for hardcover fiction books
    Then I should see a list of hardcover fiction books