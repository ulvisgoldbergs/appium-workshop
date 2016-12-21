class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'content')
    @driver = driver
  end

  def visible?
    @driver.find_element(@base[:type], @base[:value])
  end
end
