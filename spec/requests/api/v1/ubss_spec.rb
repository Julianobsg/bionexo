require "rails_helper"

describe "/api/v1/ubss", type: :request do
  it 'get a list of ubss' do
    create_list(:ubs, 10)

    get '/api/v1/ubss'
    expect(response).to be_successful

    json = JSON.parse(response.body)
    expect(json.length).to eq(10)
  end
end
