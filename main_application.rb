require_relative 'parser'
require_relative 'item'
require_relative 'cart'

class MainApplication
  attr_accessor :user_data, :parser, :cart

  def initialize(user_data)
    @user_data = user_data
    @parser = Parser.new
    @cart = Cart.new
    configure_application
  end

  def configure_application
    puts "User data: #{@user_data}"
  end

  def run
    puts "Running the application..."

    website_data = <<~DATA
        Product1 $10 Electronics 3 High-quality electronics gadget
        Product2 $25 Clothing 2 Stylish and comfortable clothing item
        Product3 $5  Home & Kitchen 5 Affordable home and kitchen accessory
    DATA

    condition_regex = /^(\w+) \$([\d.]+) (\w+) (\d+) (.+)$/
    parsed_items = @parser.parse_item(website_data, condition_regex)

    parsed_items.each do |item_data|
      item = Item.new(item_data[:name], item_data[:price], item_data[:category], item_data[:quantity], item_data[:description])
      @cart.add_item(item)
    end

    url_to_parse = 'index.html'
    first_ten_data = @parser.parse_first_ten_data(url_to_parse)

    puts "First Ten Data Points:"
    puts first_ten_data

    @cart.save_to_file("cart.txt")
    @cart.save_to_json("cart.json")
    @cart.save_to_csv("cart.csv")

    puts "Application finished."
  end
end