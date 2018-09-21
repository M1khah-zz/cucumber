@home_screen
Feature: Tests for Home screen functionality

  @default
  Scenario: Default values on Home screen is Foot and Centimeter
    Given I land on home screen
    Then Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"

  Scenario: Show All button should be enabled at launch
      Given I land on home screen
      Then Show All button should be enabled
      When I type "1" on application keyboard
      Then Show All button should be disabled

  @wip
  Scenario Outline: Verify default conversion
      Given I land on home screen
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
    Given I land on home screen
    Then I press on Add to favorites icon
    When I press on Menu icon
    Then I press on favorite conversions
    And I verify "Length" added to favorite conversions lists


  Scenario: User is able  to search by existing Conversion type
    Given I land on home screen
    Then I press search icon
    Then I type "Temperature" in search field
    And I press return button on soft keyboard
    Then I see "Temperature" as a current unit converter
    Then Left unit picker value should be "Celsius"
    And Right unit picker value should be "Fahrenheit"