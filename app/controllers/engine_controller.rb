class EngineController < ActionController::Base
	def create
	  v = Gmapi.start_stop_engine(params[:vehicle_id], params[:engine][:action])
	  if v['status'] == '200'
	    render json: format_info(v)
	  else
	    render json: {}, status: 404
	  end
  end

  def format_info(v)
    result = {}
    if v['actionResult']['status'] == 'EXECUTED'
    	result['status'] = 'success'
    else
    	result['status'] = 'error'
    end
    return result
  end
end
