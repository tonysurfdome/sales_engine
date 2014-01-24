require 'spec_helper'

describe Item do

  def item_with(overrides)
    Item.new({id: 1, 
              name: "Item Qui Esse",
              description: "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
              unit_price: 75107, 
              merchant_id: 1, 
              created_at: "2012-03-27 14:53:59 UTC", 
              updated_at: "2012-03-27 14:53:59 UTC"
             }.merge(overrides))
  end

  it 'has its initialization attributes' do
    item = item_with id: 1
    expect(item.id).to          eq(1)
    expect(item.name).to        eq("Item Qui Esse")
    expect(item.description).to eq("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    expect(item.unit_price).to  eq(75107)
    expect(item.merchant_id).to eq(1)
    expect(item.created_at).to  eq(Time.parse("2012-03-27 14:53:59 UTC"))
    expect(item.updated_at).to  eq(Time.parse("2012-03-27 14:53:59 UTC"))
  end

  it 'finds by id' do
    Item.add(item_with(id: 1))
    Item.add(item_with(id: 2))
    expect(Item.find_by_id(1).id).to eq(1)
    expect(Item.find_by_id(2).id).to eq(2)
  end

  it 'finds all by name' do
    Item.add(item_with(name: "dumbo"))
    Item.add(item_with(name: "dumbo"))
    Item.add(item_with(name: "dumbo"))
    expect(Item.find_all_by_name("dumbo").size).to eq(3)
  end
end
