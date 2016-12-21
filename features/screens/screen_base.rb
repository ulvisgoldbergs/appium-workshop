class ScreenBase
  def initialize(driver)
    @driver = driver
  end

  def element(type, value)
    Hash[:type => type, :value => value]
  end

  def enter_text(element, text)
    @driver.find_element(element[:type], element[:value]).send_keys text
    @driver.hide_keyboard
  end
end
