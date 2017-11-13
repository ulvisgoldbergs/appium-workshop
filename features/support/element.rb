class Element
  attr_accessor :value
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

  def send_keys(keys)
    $driver.find_element(@value[:type], @value[:value]).send_keys(keys)
  end

  def find_sub_element(element)
    $driver.find_element(@value[:type], @value[:value]).find_element(element.value[:type], element.value[:value])
  end

end