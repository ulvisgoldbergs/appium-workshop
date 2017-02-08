class ScreenBase
  #Izveido draiveri
  def initialize(driver)
    @driver = driver
  end

  #Elementu atrasana
  def element(type, value)
    Hash[:type => type, :value => value]
  end

  #Funkcija, kas veiks teksta ievadi text fieldos ka ari aizver klaviaturu
  def enter_text(element, text)
    @driver.find_element(element[:type], element[:value]).send_keys text
    @driver.hide_keyboard
  end
end
