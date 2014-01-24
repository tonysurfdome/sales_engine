require 'time'
require_relative 'merchant'

class Item
  
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



  class << self
    attr_accessor :items
  end

  def self.clear
    @items = []
  end

  def self.items
    @items ||= []
  end

  def self.add(item)
    items << item
  end

  def self.find_by_id(id)
    find_one('id', id)
  end

  def self.find_by_name(name)
    find_one('name', name)
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

  def self.find_by_created_at(created_at)
    find_one('created_at', created_at)
  end

  def self.find_by_updated_at(updated_at)
    find_one('updated_at', updated_at)
  end

  def self.find_all_by(attribute, value)
    items.select { |item| item.send(attribute) == value }
  end

  def self.find_one(attribute, value)
    find_all_by(attribute, value).first
  end

  def self.find_all_by_name(name)
    find_all_by('name', name)
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