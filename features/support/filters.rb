require 'date'
module Filters
  def Filters.transports
    @transports ||= Filter.new(
        cat: 'Transports',
        sub_cats: ["Vieglie auto", "Audi", "Audi A1", "Visi"],
        params: [Hash['name' => 'GADS', 'left' => '1999', 'right' => '2002']]
    )
    @transports
  end
end

class Filter
  attr_reader :name, :cat, :sub_cats, :params
  def initialize(name: '', cat: '', sub_cats: [], params: [])
    if name == ''
      @name = 'UIAuto' + DateTime.now.strftime('%Q')
    else
      @name = name
    end
    @cat = cat
    @sub_cats = sub_cats
    @params = params
  end
end