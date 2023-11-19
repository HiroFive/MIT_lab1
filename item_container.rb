module ItemContainer
    def self.included(class_instance)
      class_instance.extend(ClassMethods)
    end
  
    module ClassMethods
      def class_method_example
        puts "This is a class method"
      end
    end
  
    module InstanceMethods
      def add_item(item)
        @items ||= []
        @items << item
        puts "#{item.name} added to the container."
      end
  
      def remove_item(item)
        @items&.delete(item)
        puts "#{item.name} removed from the container."
      end
  
      def delete_items
        @items = []
        puts "All items deleted from the container."
      end
  
      def method_missing(method, *args, &block)
        if method.to_s.start_with?('show_all_items')
          show_all_items
        else
          super
        end
      end
  
      private
  
      def show_all_items
        puts "All items in the container:"
        @items.each { |item| puts item.to_s }
      end
    end
  end