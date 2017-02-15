class ScreenSelectSubCategory < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @rows = element(:id, 'category_name')
    @driver = driver
  end

  def visible?(title)
    @driver.wait { @driver.text(title).displayed? }
    @driver.wait do
      @driver.find_element(
        @rows[:type], @rows[:value]
      ).displayed?
    end
  end

  def select_sub_category(sub_name)
    found = false
    retry_count = 0
    while !found && retry_count < 30
      retry_count += 1
      @driver.find_elements(
        @rows[:type], @rows[:value]
      ).each do |item|
        next unless item.text == sub_name
        found = true
        item.click
        break
      end
      next if found
      @driver.swipe(startx: 0, starty: 0,
                    delta_x: 0, delta_y: 1, duration: 900)
    end
  end
end
