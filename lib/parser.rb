require 'csv'

class Parser
  def initialize(filename)
    @filename = filename
  end

  def parse
    @data ||= build_data
  end

  def build_data
    data = CSV.open(@filename, headers:true, header_converters: :symbol)
  end
end