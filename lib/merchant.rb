require 'time'
require_relative 'item'

class Merchant
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

  class << self
    attr_accessor :merchants
  end

  def self.clear
    @merchants = []
  end

  def self.merchants
    @merchants ||= []
  end

  def self.add(merchant)
    merchants  << merchant
  end

   def self.find_all_by(attribute, value)
    merchants.select { |merchant| merchant.send(attribute) == value }
  end

  def self.find_one(attribute, value)
    find_all_by(attribute, value).first
  end

  def self.find_by_id(id)
    find_one('id', id)
  end

  def self.find_by_name(name)
    find_one('name',name)
  end

  def self.find_by_created_at(created_at)
    find_one('created_at', created_at)
  end

  def self.find_by_updated_at(updated_at)
    find_one('updated_at', updated_at)
  end

  def self.find_all_by_name(name)
    find_all_by('name',name)
  end
end