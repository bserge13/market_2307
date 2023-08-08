class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, ammount)
    @inventory[item] += ammount
  end

  def potential_revenue
    @inventory.keys.sum do |item|
      item.price * @inventory[item]
    end 
  end

  def items_names
    @inventory.keys.map do |item|
      item.name 
    end
  end
end