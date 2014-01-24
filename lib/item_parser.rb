require 'csv'

class ItemParser
  def initialize(filename)
    @filename = filename
  end

  def parse()
    @data ||= build_data
  end

  def build_data
    data = CSV.open(@filename, headers:true, header_converters: :symbol).map do |row| 
      Item.new(row)
    end
  end
end