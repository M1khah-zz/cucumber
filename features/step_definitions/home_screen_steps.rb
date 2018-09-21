Then(/^Left unit picker value should be "([^"]*)"$/) do |value|
  actual_picker_text=find_elements(id: "select_unit_spinner")[0].text
  expect(actual_picker_text).to eq(value)
end

Then(/^Right unit picker value should be "([^"]*)"$/) do |value|
  actual_picker_text=find_elements(id: "select_unit_spinner")[1].text
  expect(actual_picker_text).to eq(value)
end


Then(/^Show All button should be (enabled|disabled)$/) do |state|
  if state == "enabled"
    puts("button is enabled")
  elsif state == "disabled"
    puts("button is disabled")
  end
end

When("I press on Clear button") do
  puts("clear button is pressed")
end

When(/^I type "([^"]*)" on application keyboard$/) do |target|
  digits = target.split("")
  digits.each do |num|
   find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
  end
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
  text(unit_type)
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


