require 'rails_helper'

describe "Destinations API" do
  before :each do
    @destinations = create_list(:destination, 4)
  end

  it "can return json for all destinations" do
    get '/api/v1/destinations'

    expect(response).to be_success

    destinations = JSON.parse(response.body, symbolize_names: true)
    expect(destinations.count).to eq(4)
    expect(destinations.first[:id]).to eq(@destinations.first.id)
  end

  it "can return json for one destination" do
    get "/api/v1/destinations/#{@destinations.first.id}"

    expect(response).to be_success

    destination = JSON.parse(response.body, symbolize_names: true)

    expect(destination[:id]).to eq(@destinations.first.id)
  end

  it "can create a destination" do
    destination_params = {name: 'Califas', description: 'nice place', image_url: "www.example.com", zip: '90211'}
    post "/api/v1/destinations", params: {destination: destination_params}

    destination = Destination.last
    expect(response).to be_success
    expect(destination.name).to eq(destination_params[:name])
  end

  it "can delete a destination" do
    delete "/api/v1/destinations/#{@destinations.first.id}"

    expect(response.status).to eq 204
  end

end
