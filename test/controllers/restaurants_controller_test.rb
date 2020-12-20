require 'test_helper'
require 'faker'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  bruce = User.create(
    name: 'Bruce',
    email: 'b@t.man',
    password: '123456'
    )
  expanded_text_restaurant = [
    {
      name: Faker::Restaurant.name,
      cuisine: %w[Italian Lebanese Japanese Belgian French Chinese].sample,
      address: Faker::Address.full_address,
      average_price: (15..50).to_a.sample.to_f,
      user: bruce
    },
    {
      name: Faker::Restaurant.name,
      cuisine: %w[Italian Lebanese Japanese Belgian French Chinese].sample,
      address: Faker::Address.full_address,
      average_price: (15..50).to_a.sample.to_f,
      user: bruce
    }
  ]

  test "should get index" do
    get  api_v1_restaurants_path, as: :json
    assert_response :success
  end

  test "should create Restaurant" do
    assert_difference 'Restaurant.count', 2 do
      expanded_text_restaurant.each do |x|
        post api_v1_restaurants_path, params: { restaurant: x}, as: :json
      end
    end

    assert_response 201
  end

  test "should show Restaurant" do
    Restaurant.all.each do |x|
      get restaurant_url(x), as: :json
      assert_response :success
    end
  end

end