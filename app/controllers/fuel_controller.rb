class FuelController < ActionController::Base
	def index
    v = Gmapi.fuel_battery_level(params[:vehicle_id])
    if v['status'] == '200'
      render json: format_info(v)
    else
      render json: {}, status: 404
    end
  end

  def format_info(v)
    result =
    {
      percent: v['data']['tankLevel']['value'].to_i
    }
  end
end
