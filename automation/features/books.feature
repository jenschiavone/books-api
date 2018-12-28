Feature: Books tests

  Scenario: Get books
    When I make a call to the Books API
    Then I should get a successful response

  Scenario Outline: Get books by genre
    Given there is a list of <genre> books
    When I make a request for the list
    Then the api should return the list

    Examples:
      | genre                   |
      | Trade Fiction Paperback |
      | Hardcover Fiction       |
      | Hardcover Nonfiction    |
