require_relative 'item'
require 'pry'

class Menu

	attr_reader :goal
	attr_accessor :items, :combinations

	def initialize(goal,items)
		@goal = goal
		@items = items
		@combinations = []
		possible_combinations
	end

	def possible_combinations
		[*1..items.length].each do |idx|
			items.combination(idx).to_a.each {|combo| combinations << combo }
		end
	end

	def select_price(price)
		combinations.select{|combo| find_total(combo) == price}
	end

	def find_total(list)
		sum = 0
		list.each {|item| sum+=item.price}
		sum
	end

end

# item1 = Item.new("orange",5)
# item2 = Item.new("banana",3)
# item3 = Item.new("chicken",9)
# item4 = Item.new("carrot",1)

# menu = Menu.new(10,[item1,item2,item3,item4])

