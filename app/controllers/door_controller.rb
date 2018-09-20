class DoorController < ActionController::Base
	def index
    v = Gmapi.security(params[:vehicle_id])
    if v['status'] == '200'
      render json: format_info(v)
    else
      render json: {}, status: 404
    end
  end

  def format_info(v)
    result = v['data']['doors']['values'].map do |l|
    {
      location: l['location']['value'],
      locked: l['locked']['value']
    }
    end
    return result
  end
end
