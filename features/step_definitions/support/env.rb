require "appium_lib"
require 'rspec'

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