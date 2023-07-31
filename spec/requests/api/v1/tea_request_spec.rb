require 'rails_helper'

RSpec.describe 'Tea Request' do
  describe 'happy path' do
    it 'can get all teas' do
      create_list(:tea, 10)

      get '/api/v1/teas'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      teas = JSON.parse(response.body, symbolize_names: true)

      expect(teas).to be_a(Hash)
      expect(teas[:data]).to be_an(Array)
      expect(teas[:data].count).to eq(10)
      teas[:data].each do |tea|
        expect(tea).to have_key(:id)
        expect(tea[:id]).to be_a(String)
        expect(tea).to have_key(:type)
        expect(tea[:type]).to be_a(String)
        expect(tea).to have_key(:attributes)
        expect(tea[:attributes]).to be_a(Hash)
        expect(tea[:attributes]).to have_key(:title)
        expect(tea[:attributes][:title]).to be_a(String)
        expect(tea[:attributes]).to have_key(:description)
        expect(tea[:attributes][:description]).to be_a(String)
        expect(tea[:attributes]).to have_key(:brew_temp)
        expect(tea[:attributes][:brew_temp]).to be_a(String)
        expect(tea[:attributes]).to have_key(:brew_time)
        expect(tea[:attributes][:brew_time]).to be_a(String)
      end
    end
  end
end