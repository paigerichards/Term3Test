require 'terminal-table'

class MenuItem
  def initialize(name, price)
    @name = name
    @price = price
  end

  attr_accessor :name, :price
end

class Order
  def initialize()
    @items = []
  end

  def << (menu_item)
    @items << menu_item
  end
  def << (entree_item)
    @items << entree_item
  end
  def << (dessert_item)
    @items << dessert_item
  end
  def << (beer_item)
    @items << beer_item
  end
  def << (wine_item)
    @items << wine_item
  end
  def << (cocktail_item)
    @items << cocktail_item
  end

  def total
    total = 0
    @items.each do |item|
      total += item.price
    end
    "$#{total}"
  end

  def bill
    table = Terminal::Table.new headings: ['Name', 'Price'] do |t|
      @items.each do |item|
        t << [item.name, "$#{item.price}"]
      end
      t.add_separator
      t << ['TOTAL', total]
    end
    table
  end
end

  puts "Welcome to the newest Restauraunt in town!"
  puts "Lucky Spuds isn't like your ordinary Restaurant!"
  puts "For those Who'd like a little bit of excitement, come on in!"
  puts "Here at Lucky Spuds, you don't order your food, we do it for you!"
  puts "All we ask is you pick a number!"
  puts "If you are however, very displeased with your Lucky Dip of Dinner, let us know!"
  puts "Before you choose a number browse our menu..."

  sleep 20

  puts '------------------------------------------'
  puts "Entree"
  ENTREE_ITEMS = [
    MenuItem.new('Chips', 5),
    MenuItem.new('Fish Bites', 7),
    MenuItem.new('Garlic Bread', 5),
    MenuItem.new('Minestrone Soup', 7),
    MenuItem.new('Pork Wontons', 7),
    MenuItem.new('Wedges', 7.50)
  ]
  ENTREE_ITEMS.each_with_index do |entree_item, index|
    user_index = index + 1
    # Display item with index first, then name and price
    puts "#{user_index}. #{entree_item.name}: #{entree_item.price}"
  end

  puts '------------------------------------------'
  puts "Main Course"
  MENU_ITEMS = [
    MenuItem.new('Steak', 20),
    MenuItem.new('Parma', 15),
    MenuItem.new('Eggplant Casserole', 15),
    MenuItem.new('Kebabs', 7),
    MenuItem.new('Roast Lamb', 17),
    MenuItem.new('Spaghetti', 8.50)
  ]
  MENU_ITEMS.each_with_index do |menu_item, index|
    user_index = index + 7
    # Display item with index first, then name and price
    puts "#{user_index}. #{menu_item.name}: #{menu_item.price}"
  end

  puts '------------------------------------------'
  puts "Dessert"

  DESSERT_ITEMS = [
    MenuItem.new('Steak', 20),
    MenuItem.new('Parma', 15),
    MenuItem.new('Eggplant Casserole', 15),
    MenuItem.new('Chips', 7),
    MenuItem.new('Beer', 7),
    MenuItem.new('Soft drink', 3.50)
  ]
  DESSERT_ITEMS.each_with_index do |dessert_item, index|
    user_index = index + 14
    # Display item with index first, then name and price
    puts "#{user_index}. #{dessert_item.name}: #{dessert_item.price}"
    end

    puts '------------------------------------------'
    puts "Drinks"
    puts '----------------------'
    puts "Beer"

    BEER_ITEMS = [
      MenuItem.new('Carlton Draught', 6),
      MenuItem.new('Carlton Dry', 6),
      MenuItem.new('Corona', 7),
      MenuItem.new('Heinkein', 7),
      MenuItem.new('Pure Blonde', 5),
      MenuItem.new('Cascade Light', 5)
    ]
    BEER_ITEMS.each_with_index do |beer_item, index|
      user_index = index + 21
      # Display item with index first, then name and price
      puts "#{user_index}. #{beer_item.name}: #{beer_item.price}"
      end

    puts '----------------------'
    puts "Wine"

    WINE_ITEMS = [
      MenuItem.new('Lambrusco', 6),
      MenuItem.new('Merlot', 6),
      MenuItem.new('Shiraz', 7),
      MenuItem.new('Cab Sav', 7),
      MenuItem.new('Chardonnay', 5),
      MenuItem.new('Champagne', 5)
    ]
    WINE_ITEMS.each_with_index do |wine_item, index|
      user_index = index + 1
      # Display item with index first, then name and price
      puts "#{user_index}. #{wine_item.name}: #{wine_item.price}"
      end


    puts '----------------------'
    puts "Cocktails"
    COCKTAIL_ITEMS = [
      MenuItem.new('Tequila Sunrise', 6),
      MenuItem.new('Sex on the Beach', 6),
      MenuItem.new('Martini', 7),
      MenuItem.new('Expresso Martini', 7),
      MenuItem.new('Mojitio', 5),
      MenuItem.new('Pina Colada', 5)
    ]
    COCKTAIL_ITEMS.each_with_index do |cocktail_item, index|
      user_index = index + 28
      # Display item with index first, then name and price
      puts "#{user_index}. #{cocktail_item.name}: #{cocktail_item.price}"
      end

  order = Order.new



  loop do
    puts 'Pick a number from 1-6! Choose wisely ;)'
    choice = gets.chomp
    # Stop looping if user pressed just enter
    break if choice == ""
    puts "You selected number #{choice}, correct? Y/N"
    answer = gets.chomp
    if answer == 'Y' || 'y' || 'yes'
    puts "Any special requests?"
    request = gets.chomp
    # User must choose an index number
    user_index = choice.to_i

    # If the user entered in an invalid choice
    if user_index == 0
      "Invalid choice, please try again"
      next # Loop through and ask again
    end


    # Converting makes the item selected show in all, fix later

    index = user_index - 1 # Convert to zero-based index
    entree_item = ENTREE_ITEMS[index]
    menu_item = MENU_ITEMS[index]
    dessert_item = DESSERT_ITEMS[index]
    beer_item = BEER_ITEMS[index]
    wine_item = WINE_ITEMS[index]
    cocktails_item = COCKTAIL_ITEMS[index]
    # Add item to order
    order << menu_item
    order << entree_item
    order << dessert_item
    order << beer_item
    order << wine_item
    order << cocktails_item
  else
    return MenuItem
  end
  end

  puts 'Thank you'
  puts ''

  sleep 2
  puts 'I hope you enjoyed your meal. Here is your bill:'
  puts order.bill
