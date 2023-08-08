class Market 
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    items = []
    @vendors.each do |vendor|
      items << vendor.items_names
    end 
    items.flatten!.uniq.sort 
  end

  def total_inventory
    item_inventory = Hash.new(0)
      @vendors.each do |vendor| 
        vendor.inventory.each do |item| 
        item_inventory[item[0]] = {:Quantity => quantity(item[0]), :Vendors => vendors_that_sell(item[0])}
        end
      end
    item_inventory
  end

  def quantity(item)
    total = 0
    @vendors.each do |vendor|
      vendor.inventory.each do |value|
        if item == value[0]
          total += value[1]
        end
      end
    end
    total
  end

  def overstocked_items
    @vendors.map do |vendor|
      vendor.inventory.count == 2 
      vendor
    end 
  end 
    # over_stock = []
    # @vendors.each do |vendor|
    #   over_stock << vendor.inventory
    # end
    # items_name = []
    # over_stock.map do |item|
    #   items_name << item.keys
    # end
    # items_name.map do |item|
    #   require 'pry'; binding.pry
    #   item.name
    # end
end