# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

menu_items = [
  {
    item_name: 'Espresso',
    category: 'coffee',
    availability: true,
    price: 300,
    description: 'A strong, concentrated coffee shot.',
    tax_amount: 0.20
  },
  {
    item_name: 'Cappuccino',
    category: 'coffee',
    availability: true,
    price: 400,
    description: 'Espresso with steamed milk and a thick layer of foam.',
    tax_amount: 0.26
  },
  {
    item_name: 'Latte',
    category: 'coffee',
    availability: true,
    price: 450,
    description: 'Espresso with steamed milk and a light layer of foam.',
    tax_amount: 0.30
  },
  {
    item_name: 'Chai Tea',
    category: 'tea',
    availability: true,
    price: 350,
    description: 'Spiced black tea with a blend of herbs and spices.',
    tax_amount: 0.23
  },
  {
    item_name: 'Green Tea',
    category: 'tea',
    availability: true,
    price: 325,
    description: 'A soothing cup of freshly brewed green tea.',
    tax_amount: 0.21
  },
  {
    item_name: 'Earl Grey Tea',
    category: 'tea',
    availability: true,
    price: 350,
    description: 'Black tea flavored with oil of bergamot.',
    tax_amount: 0.23
  },
  {
    item_name: 'Peppermint Tea',
    category: 'tea',
    availability: true,
    price: 325,
    description: 'Refreshing herbal tea made from peppermint leaves.',
    tax_amount: 0.21
  },
  {
    item_name: 'Iced Coffee',
    category: 'cold_beverages',
    availability: true,
    price: 375,
    description: 'Chilled coffee served over ice.',
    tax_amount: 0.25
  },
  {
    item_name: 'Iced Lemon Tea',
    category: 'cold_beverages',
    availability: true,
    price: 350,
    description: 'Cold brewed tea with a hint of lemon.',
    tax_amount: 0.23
  },
  {
    item_name: 'Lemonade',
    category: 'cold_beverages',
    availability: true,
    price: 325,
    description: 'Freshly squeezed lemon juice with a touch of sweetness.',
    tax_amount: 0.21
  },
  {
    item_name: 'Turkey Club Sandwich',
    category: 'sandwiches',
    availability: true,
    price: 650,
    description: 'Sliced turkey, bacon, lettuce, tomato, and mayo on toasted bread.',
    tax_amount: 0.45
  },
  {
    item_name: 'Grilled Cheese Sandwich',
    category: 'sandwiches',
    availability: true,
    price: 475,
    description: 'Classic grilled cheese with cheddar on sourdough bread.',
    tax_amount: 0.33
  },
  {
    item_name: 'Ham and Cheese Sandwich',
    category: 'sandwiches',
    availability: true,
    price: 500,
    description: 'Ham and cheese with lettuce and mustard on whole wheat bread.',
    tax_amount: 0.35
  },
  {
    item_name: 'Veggie Wrap',
    category: 'sandwiches',
    availability: true,
    price: 550,
    description: 'Fresh veggies with hummus in a whole wheat wrap.',
    tax_amount: 0.38
  }
]
def create_menu(menu_items)
  puts 'Generating menu items...'
  begin
    menu_items.each do |menu_item|
      item = Menu.new(menu_item)
      item.save!
    end
    puts 'Menu generated successfully'
  rescue => e
    puts "An error occurred: #{e.message}"
  end
end

create_menu(menu_items)
