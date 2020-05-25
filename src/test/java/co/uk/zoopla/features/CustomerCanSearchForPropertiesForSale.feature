Feature: Search Properties For Sale
  As a customer
  I want the ability to search for a property for sale
  So that I can purchase the property

Scenario Outline: Customer Can search for properties for sale
    Given I navigate to zoopla homepage
    When I enter a "<Location>" in the search text box
    And I select "<MinPrice>" from Min price dropdown
    And I select "<MaxPrice>" from Max price dropdown
    And select "<Property>" from Property type dropdown
    And I select "<Bed>" from Bedrooms dropdown
    And I click on search button
    Then a list of "<PropertyType>" in "<Location>" are displayed

    Examples:
      |Location| MinPrice|MaxPrice|Property|Bed|PropertyType|
      |Manchester|£120,000|£230,000|Houses |3+ |Houses      |
      |London|£250,000|£400,000|Farms/Land|No min| property|
      |Liverpool|£120,000|£230,000|Flats|3+ |Flats    |

      |Birmingham|          |        |   |    |          |

  Scenario Outline: customer can search for any properties
    Given I navigate to zoopla homepage
    When I enter a "<Location>" in the search text box
    And I select "<MinPrice>" from Min price dropdown
    And I select "<MaxPrice>" from Max price dropdown
    And select "<Property>" from Property type dropdown
    And I select "<Bed>" from Bedrooms dropdown
    And I click on search button
    Then a list of "<PropertyType>" in "<Location>" are displayed

    Examples:
      |Location| MinPrice|MaxPrice|Property|Bed|PropertyType|
      |        |£120,000|£230,000|Houses |3+ |Houses      |

  @ignore
  Scenario Outline: Error page is displayed for invalid search
    Given I navigate to zoopla homepage
    When I enter a "<Location>" in the search text box
    And I select "<MinPrice>" from Min price dropdown
    And I select "<MaxPrice>" from Max price dropdown
    And select "<Property>" from Property type dropdown
    And I select "<Bed>" from Bedrooms dropdown
    And I click on search button
    Then an error result page is displayed

    Examples:
      |Location| MinPrice|MaxPrice|Property|Bed|PropertyType|
      |M39 1XC|£120,000|£230,000|Houses |3+ |Houses      |
      |£££    |£250,000|£400,000|Farms/Land|No min| Property|
      |123    |£120,000|£230,000|Flats |3+ |Flats    |
      |123    ||| |  |      |
