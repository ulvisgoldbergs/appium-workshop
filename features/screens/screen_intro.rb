class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'content')
    @button_to_app = element(:id, 'close_intro')
    @driver = driver
  end

  #Parbauda vai konkrets elements atrodas Landing page
  def visible?
    #@driver.alert_accept
    @driver.find_element(@base[:type], @base[:value])
  end

  #Aizver Landing page nospiezot uz pogas "Uz Aplikaciju"
  def close_intro
    @driver.find_element(@button_to_app[:type], @button_to_app[:value]).click
  end
end
