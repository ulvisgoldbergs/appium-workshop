class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'content')
    @button_to_app = element(:id, 'close_intro')
    @driver = driver
  end

  def visible?
    @driver.alert_accept
    @driver.find_element(@base[:type], @base[:value])
  end

  def close_intro
    @driver.find_element(@button_to_app[:type], @button_to_app[:value]).click
  end
end
