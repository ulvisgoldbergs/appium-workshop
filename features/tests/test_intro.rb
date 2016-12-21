class TestIntro
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def intro_visible?
    @screens.screen_intro.visible?
  end
end
