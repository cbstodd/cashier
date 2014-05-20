class StoreController < ApplicationController
  def index
    @entrees = Entree.order(:food_item) # "order" Lists order alphebetically.

  end
end
