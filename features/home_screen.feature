@home_screen
Feature: Tests for Home screen functionality
  Background:
    Given I land on home screen

  @default
  Scenario: Default values on Home screen is Foot and Centimeter
    Then Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"


  Scenario: Show All button should be enabled at launch
      Then Show All button should be disabled
      When I type "1" on application keyboard
      Then Show All button should be enabled

  Scenario Outline: Verify default conversion
      When I type "<target>" on application keyboard
      Then I should see result as "<result>"
  Examples:
      |target|result|
      |1     |30.48    |
      |2     |60.96    |
      |3     |91.44    |
      |9     |274.32   |
      |10    |304.8    |

  Scenario: User is able to add current conversion to favorites list
    Then I press on Add to favorites icon
    When I press on Menu icon
    Then I press on favorite conversions
    And I verify "Length" added to favorite conversions lists


  Scenario: User is able  to search by existing Conversion type
    Then I press search icon
    Then I type "Temperature" in search field
    And I press return button on soft keyboard
    Then I see "Temperature" as a current unit converter
    Then Left unit picker value should be "Celsius"
    And Right unit picker value should be "Fahrenheit"


  Scenario Outline: User is able to select values from unit pickers
    Then I select "<unit_type>" from left unit picker
    When I type "<amount>" on application keyboard
    Then I should see result as "<result>"

    Examples:
    | unit_type | amount | result|
    | Inch1 | 1 | 2.54 |
    | Link1 | 1 | 20.1168 |

  @wip
  Scenario:  User is able to convert values
    When I press on Menu icon
    Then I select "Volume" from menu
    Then I select "Cup" from right unit picker
    When I type "1" on application keyboard
    Then I should see result as "15.1416"


  Scenario:  User is able to switch values
    Then Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"
    When I press on switch units button
    Then Left unit picker value should be "Centimeter"
    And Right unit picker value should be "Foot"


  Scenario:  User is able to cleanup conversion history
    When I press on Menu icon
    Then I select "History" from menu
    And I see "History" as a current unit converter
    Then I should see text "No history right now"
    When I press on Menu icon
    Then I select "Length" from menu
    When I type "1" on application keyboard
    When I press on Menu icon
    Then I select "History" from menu
    And I verify that 1st result in history list is "Length"
    When I press delete from history at 1st row
    Then I should see text "No history right now"


