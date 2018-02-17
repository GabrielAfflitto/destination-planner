require 'rails_helper'

describe "Destinations" do
  before :each do
    @destinations = create_list(:destination, 4)
  end

  it "can return json for all destinations" do
    get 'api/v1/destinations'

    expect(response).to be_success

    destinations = JSON.parse(response.body, symbolize_names: true)
    expect(destinations.count).to eq(4)
    expect(destinations.first[:id]).to eq(@items.first.id)
  end

  it "can return json for one destination" do
    get "api/v1/destinations/#{@destinations.first.id}"

    expect(response).to be_success

    destination = JSON.parse(response.body, symbolize_names: true)

    expect(destination[:id]).to eq(@destinations.first.id)
  end

  it "can create a destination" do
    post "api/v1/destinations", :params => {name: "Califas",
                                     description: "nice place",
                                     image: "www.example.com",
                                     zip: "90210"}
    expect(response.status).to eq 201
    destination = JSON.parse(response.body)

    expect(destination["name"]).to eq("Califas")
  end

  it "can delete a destination" do
    delete "api/v1/destinations#{@destinations.first.id}"

    expect(response.status).to eq(204)
  end

end
