require 'time'
require_relative 'item'
require_relative 'sales_engine_helper'

class Merchant 
  extend SalesEngineHelper

  attr_reader :id,:name,:created_at,:updated_at, :items

  def initialize(args)
    @id = args[:id].to_i
    @name = args[:name]
    @created_at = Time.parse args[:created_at] if !args[:created_at].nil?
    @updated_at = Time.parse args[:updated_at] if !args[:updated_at].nil?
  end

  def items
    @items ||= Item.find_all_by_merchant_id(@id)
  end


end