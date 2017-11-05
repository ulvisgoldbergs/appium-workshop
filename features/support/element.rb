class Element
  def initialize(type, value)
    @value = Hash[:type => type, :value => value]
  end

  def visible?
    $driver.wait { $driver.find_element(@value[:type], @value[:value]).displayed? }
  end

  def any?
    $driver.find_elements(@value[:type], @value[:value]).any?
  end

  def click
    $driver.find_element(@value[:type], @value[:value]).click
  end

  def click_by_text(text)
    # element = $driver.find_element(@value[:type], @value[:value])
    # print "//parent::*/*[contains(@text, #{text})]"
    # //*[contains(@resource-id, 'main_row_text')]//parent::*/*[contains(@text, 'Transports')]
    # print element.methods
    # element.find_element(:id, "main_row_text").click
    $driver.find_element(:xpath, "//*[contains(@text, '#{text}')]").click
  end

  def scroll_to_exact(text)
    $driver.scroll_to_exact(text)
  end

end