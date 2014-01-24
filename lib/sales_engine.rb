require_relative 'item_parser'

class SalesEngine

  def startup
    item_parser = ItemParser.new(File.expand_path('../../data/items.csv', __FILE__))
    item_parser.parse.each do |row| 
      Item.add row
    end
  end
end