require 'rails_helper'

RSpec.describe 'Subscription Request' do
  describe 'create subscription' do
    it 'can create a subscription - happy path' do
      user = create(:customer)
      tea = create(:tea)

      subscription_params = {
        customer_id: user.id,
        tea_id: tea.id,
        frequency: 'monthly',
        status: 'active',
        price: '10.00',
        title: 'Tea Subscription'
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/subscriptions', headers: headers, params: JSON.generate(subscription_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(subscription).to be_a(Hash)
      expect(subscription[:data]).to be_a(Hash)
      expect(subscription[:data]).to have_key(:id)
      expect(subscription[:data][:id]).to be_a(String)
      expect(subscription[:data]).to have_key(:type)
      expect(subscription[:data][:type]).to be_a(String)
      expect(subscription[:data]).to have_key(:attributes)
      expect(subscription[:data][:attributes]).to be_a(Hash)
      expect(subscription[:data][:attributes]).to have_key(:customer_id)
      expect(subscription[:data][:attributes][:customer_id]).to be_an(Integer)
      expect(subscription[:data][:attributes][:customer_id]).to eq(user.id)
      expect(subscription[:data][:attributes]).to have_key(:tea_id)
      expect(subscription[:data][:attributes][:tea_id]).to be_an(Integer)
      expect(subscription[:data][:attributes][:tea_id]).to eq(tea.id)
      expect(subscription[:data][:attributes]).to have_key(:frequency)
      expect(subscription[:data][:attributes][:frequency]).to be_a(String)
      expect(subscription[:data][:attributes]).to have_key(:status)
      expect(subscription[:data][:attributes][:status]).to be_a(String)
      expect(subscription[:data][:attributes]).to have_key(:price)
      expect(subscription[:data][:attributes][:price]).to be_a(String)
      expect(subscription[:data][:attributes]).to have_key(:title)
      expect(subscription[:data][:attributes][:title]).to be_a(String)
    end

    it 'can create a subscription - sad path' do
      user = create(:customer)

      invalid_params = {
        customer_id: user.id,
        tea_id: 123456778905678,
        frequency: 'monthly',
        status: 'active',
        price: '10.00',
        title: 'Tea Subscription'
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/subscriptions', headers: headers, params: JSON.generate(invalid_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(subscription).to be_a(Hash)
      expect(subscription).to have_key(:error)
      expect(subscription[:error]).to be_a(String)
      expect(subscription[:error]).to eq("Tea must exist")
    end
  end

  describe 'cancel subscription' do
    it 'can cancel a subscription - happy path' do
      user = create(:customer)
      tea = create(:tea)
      subscription = create(:subscription, customer_id: user.id, tea_id: tea.id)

      put "/api/v1/subscriptions/#{subscription.id}/cancel"

      expect(response).to be_successful
      expect(Subscription.last.status).to eq('cancelled')
    end
  end
end