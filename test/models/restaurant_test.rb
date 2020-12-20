require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "should not save a restaurant with a wrong cuisine" do
    restaurant = Restaurant.new(name: 'Futon Factory', cuisine: 'Futon & Tatamis', address: "8 Rue d'Argenteuil, 75001 Paris, France", average_price: 20)
    assert_not restaurant.save, "Saved the restaurant with a bad cuisine"
  end
  test "should not save a restaurant with no name" do
    restaurant = Restaurant.new(address: "13 rue van Aa 1050 Ixelles Belgique", cuisine: 'Belgian', average_price: '20')
    assert_not restaurant.save, "Saved the restaurant with no name"
  end
  test "should save a restaurant with everything correct" do
    restaurant = Restaurant.new(name: 'Exki Porte de Namur', cuisine: 'Belgian', address: "Chaussée d'Ixelles 12, 1050 Bruxelles", average_price: 20)
    assert restaurant.save, "Didn't save a correct restaurant"
  end
end
