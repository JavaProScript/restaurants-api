module Api
  module V1
    class RestaurantsController < Api::V1::BaseController
      before_action :set_restaurant, only: %i[show update destroy]
      def index
        @restaurants = policy_scope(Restaurant)
      end

      def show
      end

      def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.user = current_user
        authorize @restaurant
        if @restaurant.save
          render :show, status: :created
        else
          render_error
        end
      end

      def update
        if @restaurant.update(restaurant_params)
          render :show
        else
          render_error
        end
      end

      def destroy
        @restaurant.destroy
        head :no_content
      end

      private

      def set_restaurant
        @restaurant = Restaurant.find(params[:id])
        authorize @restaurant
      end

      def restaurant_params
        params.require(:restaurant).permit(:name, :address, :cuisine, :average_price)
      end

      def render_error
        render json: { errors: @restaurant.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end
end
