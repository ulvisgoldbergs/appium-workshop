class ScreensSearchFilter < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @filter_name = element(:id, 'row_filter_name')
    @driver = driver
  end

  def visible?(title)
    @driver.wait { @driver.text(title).displayed? }
  end

  def check_filter(name)
    if @driver.find_element(
      @filter_name[:type], @filter_name[:value]
    ).text.eql? name
      puts 'Filter with name ' + name + ' exists'
    else
      raise 'Filter not found'
    end
  end
end
