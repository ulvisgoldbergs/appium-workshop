require 'yaml'
class Filter
  @parameters = []

  def initialize(type)
    config = YAML.load_file('filters.yml')[type]
    @name = config['name']
    @category = config['category']
    @sub_categories = []
    config['sub_categories'].each do |sub_cat|
      temp_hash = {'title' => sub_cat['sub_category'].first['title'], 'option' => sub_cat['sub_category'].last['option']}
      @sub_categories.push temp_hash
    end

  end

  def print_properties
    print 'Name:' + @name
    print "\nCategory:" + @category
    print "\nSub Categories:"
    # p @sub_categories
    @sub_categories.each do |sub_cat|
      print "\n\t - " + sub_cat['title'] + ' ' + sub_cat['option']
    end
  end
end

filter = Filter.new('property_positive')

filter.print_properties
