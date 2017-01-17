class TestIntro
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def intro_visible?
    @screens.screen_intro.visible?
  end

  def close_intro
    @screens.screen_intro.visible?
    @screens.screen_intro.close_intro
    @screens.screen_create_filter.visible?
  end
end
