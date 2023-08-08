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
end




    # require 'pry'; binding.pry
    # items = []
    # @inventory.each do |inventory_hash| 
    #   items << inventory_hash
    # end
    # items.map do |item|
    #   item.price * item.values
    # end
    #the sum of all their items' price * quantity.