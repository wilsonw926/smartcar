class Gmapi
	include HTTParty
	base_uri 'http://gmapi.azurewebsites.net'
	
	def self.vehicle_info(id)
    JSON.parse(post('/getVehicleInfoService',
      body: {id: id, responseType: 'JSON'}.to_json,
      headers: {'Content-Type' => 'application/json'}).body)
  end
  
  def self.security(id)
    JSON.parse(post('/getSecurityStatusService',
      body: {id: id, responseType: 'JSON'}.to_json,
      headers: {'Content-Type' => 'application/json'}).body)
  end
  
  def self.fuel_battery_level(id)
    JSON.parse(post('/getEnergyService',
      body: {id: id, responseType: 'JSON'}.to_json,
      headers: {'Content-Type' => 'application/json'}).body)
  end
  
  def self.start_stop_engine(id, command)
    action = "START_VEHICLE"
    if command != 'START'
      action = "STOP_VEHICLE"
    end
    JSON.parse(post('/actionEngineService',
      body: {id: id, command: action, responseType: 'JSON'}.to_json,
      headers: {'Content-Type' => 'application/json'}).body)
  end
end