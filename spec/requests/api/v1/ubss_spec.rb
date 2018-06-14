require 'rails_helper'

describe '/api/v1/ubss', type: :request do
  let(:json) { JSON.parse(response.body) }
  it 'get a list of ubss' do
    create_list(:ubs, 20)

    get '/api/v1/ubss'
    expect(response).to be_successful

    expect(json['entries'].length).to eq(10)
  end

  it 'serializes ubs json' do
    ubs = create(:ubs)
    get '/api/v1/ubss'
    expect(json['entries'][0]).to include_json(
      id: ubs.id,
      name: 'UBS REAL PQ PAULO MANGABEIRA ALBERNAZ FILHO',
      address: 'RUA BARAO MELGACO',
      city: 'São Paulo',
      phone: '1137582329',
      geocode: {
        lat: -23.6099946498864,
        long: -46.7057347297655
      },
      scores: {
        size: 3,
        adaptation_for_seniors: 3,
        medical_equipment: 1,
        medicine: 3
      }
    )
  end

  it 'checks meta tags' do
    create_list(:ubs, 4)
    get '/api/v1/ubss'
    expect(json).to include_json(total_entries: 4)
  end

  it 'gets second page in ubs list' do
    create_list(:ubs, 15)
    get '/api/v1/ubss?page=2'
    expect(json['entries'].length).to eq(5)
  end

  it 'gets the number of ubss according to per page value' do
    create_list(:ubs, 15)
    get '/api/v1/ubss?per_page=15'
    expect(json['entries'].length).to eq(15)
  end

  it 'find ubs by query param latitude and longitude' do
    create_list(:ubs, 10)
    ubs = create(:ubs, latitude: -23.6099946498864, longitude: 10.13123123123);
    get '/api/v1/ubss?query=-23.6099946498864,10.13123123123'

    expect(json['entries'].length).to eq(1)
    expect(json['entries'][0]).to include_json(
      geocode: {
        lat: -23.6099946498864,
        long: 10.13123123123
      }
    )
  end
end
