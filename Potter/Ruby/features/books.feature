Feature: Multiple book sales discounts
  In order to sell more books
  As a merchant
  I want to offer discounts for multiple book purchases

  Background:
    Given I have a collection of books

  Scenario: 1 book is full price
    Given I have 1 book in my cart
    When I calculate the cost
    Then the total shoud be $8.00
