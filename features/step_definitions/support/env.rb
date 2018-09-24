require "appium_lib"
require 'rspec'
require 'pry'

def caps
{ caps: {
    deviceName: "Anyname",
    platformName: "Android",
    app: (File.join(File.dirname(__FILE__), "PreciseUnitConversion.apk")),
    appPackage: "com.ba.universalconverter",
    appActivity: "MainConverterActivity",
    newCommandTimeout: "3600"
}}
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def find_in_list(value)
  3.times {Appium::TouchAction.new.swipe(start_x:0.5, start_y:0.2, end_x:0.5, end_y:0.8, duration:600).perform}
  current_screen = get_source
  previous_screen = ""

  until (exists {text(value)}) || (current_screen == previous_screen) do
    Appium::TouchAction.new.swipe(start_x:0.5, start_y:0.8, end_x:0.5, end_y:0.2, duration:600).perform
    previous_screen = current_screen
    current_screen = get_source
  end

  if exists {text(value)}
    text(value).click
  else
    fail("Can't find element with text #{value} ")
  end
end