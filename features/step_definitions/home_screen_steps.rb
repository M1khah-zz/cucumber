Then(/^Left unit picker value should be "([^"]*)"$/) do |value|
  actual_picker_text=find_elements(id: "select_unit_spinner")[0].text
  expect(actual_picker_text).to eq(value)
end

Then(/^Right unit picker value should be "([^"]*)"$/) do |value|
  actual_picker_text=find_elements(id: "select_unit_spinner")[1].text
  expect(actual_picker_text).to eq(value)
end


Then(/^Show All button should be (enabled|disabled)$/) do |state|
  button_state = find_element(id: "btn_show_all").enabled?
  case
    when state == "enabled"
      expect(button_state).to be true
    when state == "disabled"
      expect(button_state).to be false
  end
end

When("I press on Clear button") do
  puts("clear button is pressed")
end

When(/^I type "([^"]*)" on application keyboard$/) do |target|
  digits = target.split("")
  digits.map {|num| find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click }
end

Then(/^I should see result as "([^"]*)"$/) do |result|
  actual_result_value=find_element(id: "target_value").text
  expect(actual_result_value).to eq(result)
end


Then(/^I press on Add to favorites icon$/) do
  find_element(id: "action_add_favorites").click
end

Then(/^I press on favorite conversions$/) do
  text("Favorite conversions").click
end

And(/^I verify "([^"]*)" added to favorite conversions lists$/) do |unit_type|
  item_text = find_element(id: "favorites_item_hint").text
  expect(unit_type).to eq(item_text)
end


Then(/^I press search icon$/) do
  find_element(id: "action_search").click
end

Then(/^I type "([^"]*)" in search field$/) do |text|
  find_element( id:"search_src_text").send_keys(text)
end

And(/^I press return button on soft keyboard$/) do
  Appium::TouchAction.new.tap(x:0.99, y:0.99, count: 1).perform
end

Then(/^I see "([^"]*)" as a current unit converter$/) do |current_unit|
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{current_unit}']")
end


Then(/^I select "([^"]*)" from left unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[0].click
  find_in_list(value)
end

Then(/^I select "([^"]*)" from menu$/) do |value|
  text(value).click
end

Then(/^I select "([^"]*)" from right unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[1].click
  find_in_list(value)
end


When(/^I press on switch units button$/) do
  find_element(id: "img_switch").click
end

Then(/^I should see text "([^"]*)"$/) do |value|
  text(value)
end

And(/^I verify that (\d+)(?:st|nd|rd|th)? result in history list is "([^"]*)"$/) do |index, text|
  parent_element = find_element(id: "history_conversions_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  actual_text = array_of_elements[index.to_i - 1].find_element(id: "history_item_hint")
  expect(actual_text).to eq(text)
end

When(/^I press delete from history at 1st row$/) do |index|
  parent_element = find_element(id: "history_conversions_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  array_of_elements[index.to_i - 1].find_element(id: "deleteicon").click
end