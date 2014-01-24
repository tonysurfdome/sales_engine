require 'spec_helper'

describe 'Integration Spec' do
  it 'loads the Item data and allows me to query it' do
    engine = SalesEngine.new
    engine.startup # this should load the items into the Item class

    # find by id, and attributes are set
    item1 = Item.find_by_id(1)
    expect(item1.id).to          eq(1)
    expect(item1.name).to        eq("Item Qui Esse")
    expect(item1.description).to eq("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    expect(item1.unit_price).to  eq(75107)
    expect(item1.merchant_id).to eq(1)
    expect(item1.created_at).to  eq(Time.parse("2012-03-27 14:53:59 UTC"))
    expect(item1.updated_at).to  eq(Time.parse("2012-03-27 14:53:59 UTC"))

    # find_by_name
    item = Item.find_by_name(item1.name)
    expect(item).to eq(item1)

    # find_by_description
    item = Item.find_by_description(item1.description)
    expect(item).to eq(item1)

    # find_by_unit_price
    item = Item.find_by_unit_price(item1.unit_price)
    expect(item).to eq(item1)

    # find_by_merchant_id
    item = Item.find_by_merchant_id(item1.merchant_id)
    expect(item).to eq(item1)

    # find_by_created_at
    item = Item.find_by_created_at(item1.created_at)
    expect(item).to eq(item1)

    # find_by_updated_at
    item = Item.find_by_updated_at(item1.updated_at)
    expect(item).to eq(item1)

    # find_all_by_name
    items = Item.find_all_by_name(item1.name)
    expect(items).to eq([item1])

    # find_all_by_description
    items = Item.find_all_by_description(item1.description)
    expect(items).to eq([item1])

    # find_all_by_unit_price
    items = Item.find_all_by_unit_price(item1.unit_price)
    expect(items.size).to eq(2)

    # find_all_by_merchant_id
    items = Item.find_all_by_merchant_id(item1.merchant_id)
    expect(items.size).to eq(15)

    # can associate it to the merchant
    merchant1 = item1.merchant
    expect(merchant1.id).to eq(1)
  end


  it 'loads the Merchant data and allows me to query it' do
    engine = SalesEngine.new
    engine.startup # this should load the merchants into the Merchant class

    # find by id, and attributes are set
    merchant1 = Merchant.find_by_id(1)
    expect(merchant1.id).to          eq(1)
    expect(merchant1.name).to        eq("Schroeder-Jerde")
    expect(merchant1.created_at).to  eq(Time.parse("2012-03-27 14:53:59 UTC"))
    expect(merchant1.updated_at).to  eq(Time.parse("2012-03-27 14:53:59 UTC"))

    # find_by_name
    merchant = Item.find_by_name(merchant1.name)
    expect(merchant).to eq(merchant1)

    # find_by_created_at
    merchant = Merchant.find_by_created_at(merchant1.created_at)
    expect(merchant).to eq(merchant1)

    # find_by_updated_at
    merchant = Merchant.find_by_updated_at(merchant1.updated_at)
    expect(merchant).to eq(merchant1)

    # find_all_by_name
    merchants = Merchant.find_all_by_name(merchant1.name)
    expect(merchants).to eq([merchant1])

    # can associate it to the items
    items = merchant1.items
    item_ids = items.map { |item| item.id }
    expect(item_ids).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])
  end

  it 'understands the associations' do
    SalesEngine.new.startup
    item1 = Item.find_by_id(1)
    expect(item1.merchant.items.first).to eq(item1)
  end
end
