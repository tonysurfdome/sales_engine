require_relative 'parser'

class SalesEngine

  def startup
    Item.clear
    Merchant.clear

    item_parser = Parser.new(File.expand_path('../../data/items.csv', __FILE__))
    item_parser.parse.map do |row| 
      Item.add Item.new(row)
    end

    merchant_parser = Parser.new(File.expand_path('../../data/merchants.csv', __FILE__))
    merchant_parser.parse.map do |row| 
      Merchant.add Merchant.new(row)
    end
  end
end