require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Parser
    def parse_item(data, condition_regex)
      matches = data.scan(condition_regex)
  
      parsed_items = matches.map do |match|
        {
          name: match[0],
          price: match[1].to_f,
          category: match[2],
          quantity: match[3],
          description: match[4]
        }
      end
  
      parsed_items
    end

    def parse_first_ten_data(url)
        html_data = open(url)
        doc = Nokogiri::HTML(html_data)
    
        first_ten_data = doc.css('p').first(10).map(&:text)

        first_ten_data
      end
  end