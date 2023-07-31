require 'rails_helper'

RSpec.describe 'Customer Request' do
  describe 'happy path' do
    it 'can get all customers' do
      create_list(:customer, 10)

      get '/api/v1/customers'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      customers = JSON.parse(response.body, symbolize_names: true)

      expect(customers).to be_a(Hash)
      expect(customers[:data]).to be_an(Array)
      expect(customers[:data].count).to eq(10)
      customers[:data].each do |customer|
        expect(customer).to have_key(:id)
        expect(customer[:id]).to be_a(String)
        expect(customer).to have_key(:type)
        expect(customer[:type]).to be_a(String)
        expect(customer).to have_key(:attributes)
        expect(customer[:attributes]).to be_a(Hash)
        expect(customer[:attributes]).to have_key(:first_name)
        expect(customer[:attributes][:first_name]).to be_a(String)
        expect(customer[:attributes]).to have_key(:last_name)
        expect(customer[:attributes][:last_name]).to be_a(String)
        expect(customer[:attributes]).to have_key(:email)
        expect(customer[:attributes][:email]).to be_a(String)
        expect(customer[:attributes]).to have_key(:address)
        expect(customer[:attributes][:address]).to be_a(String)
      end
    end
  end
end