class VegetablesController < ApplicationController
  def index
    @ripe_vegetables = Vegetable.ripe_vegetables
    @not_ripe_vegetables = Vegetable.not_ripe_vegetables
    @column_size = Vegetable.get_col_size(@ripe_vegetables)
  end
end
