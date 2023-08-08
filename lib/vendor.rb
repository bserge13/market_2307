class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    # require 'pry'; binding.pry
    @inventory[item]
  end

  def stock(item, ammount)
    @inventory[item] += ammount
  end
end