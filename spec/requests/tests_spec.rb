require 'rails_helper'
# require 'spec_helper'

describe "routing tests" do
  #get vehicle info
  it "get vehicle info 1234" do
  	get '/vehicle/1234'
    expect(response.body).to eq(
      {
        vin: '123123412412',
        color: 'Metallic Silver',
        doorCount: 4,
        driveTrain: 'v8'
      }.to_json
    )
  end

  it "get vehicle info 1235" do
    get '/vehicle/1235'
    expect(response.body).to eq(
      {
        vin: '1235AZ91XP',
        color: 'Forest Green',
        doorCount: 2,
        driveTrain: 'electric'
      }.to_json
    )
  end

  it "get vehicle info error" do
    get '/vehicle/1236'
    expect(response.status).to eq 404
  end

  #get vehicle security (door)
  it 'get vehicle security 1234' do
    get '/vehicle/1234/door'
    expect(JSON.parse(response.body).first['location']).to be_in(['frontLeft', 'frontRight', 'backLeft', 'backRight'])
    expect(JSON.parse(response.body).first['locked']).to be_in(['True', 'False'])
    expect(JSON.parse(response.body).second['location']).to be_in(['frontLeft', 'frontRight', 'backLeft', 'backRight'])
    expect(JSON.parse(response.body).second['locked']).to be_in(['True', 'False'])
    expect(JSON.parse(response.body).third['location']).to be_in(['frontLeft', 'frontRight', 'backLeft', 'backRight'])
    expect(JSON.parse(response.body).third['locked']).to be_in(['True', 'False'])
    expect(JSON.parse(response.body).fourth['location']).to be_in(['frontLeft', 'frontRight', 'backLeft', 'backRight'])
    expect(JSON.parse(response.body).fourth['locked']).to be_in(['True', 'False'])
  end

  it 'get vehicle security 1235' do
    get '/vehicle/1235/door'
    expect(JSON.parse(response.body).first['location']).to be_in(['frontLeft', 'frontRight', 'backLeft', 'backRight'])
    expect(JSON.parse(response.body).first['locked']).to be_in(['True', 'False'])
    expect(JSON.parse(response.body).second['location']).to be_in(['frontLeft', 'frontRight', 'backLeft', 'backRight'])
    expect(JSON.parse(response.body).second['locked']).to be_in(['True', 'False'])
  end

  it "get vehicle security error" do
    get '/vehicle/1236/door'
    expect(response.status).to eq 404
  end

  #get vehicle battery
  it 'get vehicle battery 1234' do
    get '/vehicle/1234/battery'
    expect(JSON.parse(response.body)['percent']).to be_kind_of(Integer)
  end

  it 'get vehicle battery 1235' do
    get '/vehicle/1235/battery'
    expect(JSON.parse(response.body)['percent']).to be_kind_of(Integer)
  end

  it "get vehicle battery error" do
    get '/vehicle/1236/battery'
    expect(response.status).to eq 404
  end

  #get vehicle fuel
  it 'get vehicle fuel 1234' do
    get '/vehicle/1234/fuel'
    expect(JSON.parse(response.body)['percent']).to be_kind_of(Integer)
  end

  it 'get vehicle fuel 1235' do
    get '/vehicle/1235/fuel'
    expect(JSON.parse(response.body)['percent']).to be_kind_of(Integer)
  end

  it "get vehicle fuel error" do
    get '/vehicle/1236/fuel'
    expect(response.status).to eq 404
  end

  #start/stop engine
  it 'start engine 1234' do
    params = { "action" => "START" }
    headers = { "CONTENT_TYPE" => "application/json" }
    expect(Gmapi).to receive(:start_stop_engine).with('1234', 'START').and_call_original
    post '/vehicle/1234/engine', params: params.to_json, headers: headers
    expect(JSON.parse(response.body)['status']).to be_in(["success", "error"])
  end

  it 'start engine 1235' do
    params = { "action" => "STOP" }
    headers = { "CONTENT_TYPE" => "application/json" }
    expect(Gmapi).to receive(:start_stop_engine).with('1235', 'STOP').and_call_original
    post '/vehicle/1235/engine', params: params.to_json, headers: headers
    expect(JSON.parse(response.body)['status']).to be_in(["success", "error"])
  end

  it 'start engine error' do
    params = { "action" => "START" }
    headers = { "CONTENT_TYPE" => "application/json" }
    post '/vehicle/1236/engine', params: params.to_json, headers: headers
    expect(response.status).to eq 404
  end

end