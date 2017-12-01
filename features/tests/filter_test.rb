class FilterTest
  def initialize(pages, filters)
    @pages = pages
    @filters = filters
  end

  def close_intro
    @pages.page_intro.close_intro_if_visible
    @pages.page_create_filter.visible?
  end

  def open_filter_params
    @pages.page_create_filter.open_category(@filters.transports.cat)
    @filters.transports.sub_cats.each do |sub_cat|
      @pages.page_sub_category.open_sub_category(sub_cat)
    end
    @pages.page_paremeters.visible?
  end

  def set_filter_params
    @pages.page_paremeters.set_name(@filters.transports.name)
    @filters.transports.params.each do |param|
      @pages.page_paremeters.set_parameter(param)
    end
  end

  def submit_filter
    set_filter_params
    @pages.page_paremeters.save_filter
  end
end