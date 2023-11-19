require 'json'
require 'csv'
require_relative 'item_container'

class Cart
  include ItemContainer

  attr_accessor :items

  def initialize
    @items = [] 
  end

  def add_item(item)
    @items << item
  end

  def save_to_file(filename)
    File.open(filename, 'w') do |file|
      file.puts "Cart Items:"
      @items.each do |item|
        file.puts "#{item.name}: $#{item.price}, #{item.quantity} #{item.description}"
      end
    end
    puts "Cart saved to #{filename}"
  end

  def save_to_json(filename)
    json_data = @items.map do |item|
      { name: item.name, price: item.price, quantity: item.quantity, description: item.description }
    end
    File.open(filename, 'w') do |file|
      file.puts JSON.pretty_generate(json_data)
    end
    puts "Cart saved to #{filename}"
  end

  def save_to_csv(filename)
    CSV.open(filename, 'w') do |csv|
      csv << ['Name', 'Price', 'Quantity', 'Description']
      @items.each do |item|
        csv << [item.name, item.price, item.quantity, item.description]
      end
    end
    puts "Cart saved to #{filename}"
  end
end