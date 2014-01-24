require 'time'
require_relative 'merchant'
require_relative 'sales_engine_helper'

class Item
  extend SalesEngineHelper 

  attr_reader :id,:name,:description,:unit_price,:merchant_id,:created_at,:updated_at

  def initialize(args)
    @id = args[:id].to_i
    @name = args[:name]
    @description = args[:description]
    @unit_price = args[:unit_price].to_i
    @merchant_id = args[:merchant_id].to_i
    @created_at = Time.parse args[:created_at]
    @updated_at = Time.parse args[:updated_at]
  end 

  def merchant
    @merchant ||= Merchant.find_by_id(@merchant_id)
  end


  def self.find_by_description(description)
    find_one('description', description)
  end

  def self.find_by_unit_price(unit_price)
    find_one('unit_price', unit_price)
  end

  def self.find_by_merchant_id(merchant_id)
    find_one('merchant_id', merchant_id)
  end


  def self.find_all_by_description(desc)
    find_all_by('description', desc)
  end

  def self.find_all_by_unit_price(unit_price)
    find_all_by('unit_price', unit_price)
  end

  def self.find_all_by_merchant_id(merchant_id)
    find_all_by('merchant_id', merchant_id)
  end

end