class TestFilterExistance
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def check_filter_existance
    @screens.screen_serach_filters.visible? 'Meklēšanas filtri'
    @screens.screen_serach_filters.check_filter 'Filter 1'
  end

  def check_screen
    @screens.screen_set_filter_parameters.visible?
  end
end
