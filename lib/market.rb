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
    total_inventory = Hash.new(0)
  end

  def overstocked_items
    @vendors.detect do |vendor|
      # require 'pry'; binding.pry
      vendor.inventory == vendor.inventory
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