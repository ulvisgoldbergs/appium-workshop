require 'yaml'
class Filter
  attr_accessor :name, :category, :sub_categories, :parameters

  def initialize(type)
    config = YAML.load_file('features/config/filters.yml')[type]
    @name = config['name']
    @category = config['category']
    @sub_categories = []
    config['sub_categories'].each do |sub_cat|
      @sub_categories.push sub_cat
    end
    @parameters = []
    unless config['parameters'].nil?
      config['parameters'].each do |parameter|
        @parameters.push parameter
      end
    end
  end
end
