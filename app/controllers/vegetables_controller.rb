class VegetablesController < ApplicationController
  def index
    @ripe_vegetables = Vegetable.ripe_vegetables
    @not_ripe_vegetables = Vegetable.not_ripe_vegetables
    @column_size = Vegetable.get_col_size(@ripe_vegetables)

    ripe_span = { }
    veg_names = Vegetable.all.collect {|vegetable| vegetable.name}

    Vegetable.all.each do |vegetable|
      if !vegetable.winter_vegetable
        ripe_start = Date.strptime("2016-#{vegetable.start_day}", "%Y-%j")
        formatted_start = ripe_start.strftime('%b %-d')
        ripe_end = Date.strptime("2016-#{vegetable.end_day}", "%Y-%j")
        formatted_end = ripe_end.strftime('%b %-d')
        ripe_span[vegetable.name] = [start_day: formatted_start, end_day: formatted_end]
      else
        ripe_start = Date.strptime("2016-#{vegetable.start_day}", "%Y-%j")
        formatted_start = ripe_start.strftime('%b %-d')
        ripe_end = Date.strptime("2016-#{vegetable.end_day - 365}", "%Y-%j")
        formatted_end = ripe_end.strftime('%b %-d')
        ripe_span[vegetable.name] = [start_day: formatted_start, end_day: formatted_end]
      end
    end

    # TODO make this guy dynamic
    current_year = 2016

    veg_data = { year: current_year, ripe_span: ripe_span, names: veg_names }

    respond_to do |format|
      format.html { render :index }
      format.json { render json: veg_data }
    end
  end

end
