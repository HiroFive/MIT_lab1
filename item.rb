class Item
    attr_accessor :name, :price, :category, :quantity, :description
  
    def initialize(name, price, category, quantity, description)
      @name = name
      @price = price
      @category = category
      @quantity = quantity
      @description = description
    end
  
    def info(&block)
      if block_given?
        block.call(self)
      else
        puts "Item Information:"
        puts "Name: #{@name}"
        puts "Price: $#{@price}"
        puts "Category: #{@category}"
        puts "Quantity: #{@quantity}"
        puts "Description: #{@description}"
      end
    end
  
    def to_s
      "#{@name}, #{@price}, #{@category}, #{@quantity}, #{@description}"
    end
  
    def to_h
      {
        name: @name,
        price: @price,
        category: @category,
        quantity: @quantity,
        description: @description
      }
    end
  end