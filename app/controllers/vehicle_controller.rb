class VehicleController < ActionController::Base
	def show
		v = Gmapi.vehicle_info(params[:id])
		if v['status'] == '200'
      render json: format_info(v)
    else
      render json: {}, status: 404
    end
	end

	def format_info(v)
    result = {}
    result['vin'] = v['data']['vin']['value']
    result['color'] = v['data']['color']['value']
    if v['data']['fourDoorSedan']['value'] == 'True'
    	result['doorCount'] = 4
    else
      result['doorCount'] = 2
    end
    result['driveTrain'] = v['data']['driveTrain']['value']
    return result
  end
end
