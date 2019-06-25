require 'rails_helper'
describe 'purchase a title route', :type => :request do

  context 'purchase something never purchased before' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:movies) {FactoryBot.create_list(:movie, 20)}
    let!(:seasons) {FactoryBot.create_list(:season, 20)}
    before { post '/api/v1/purchases', params: { user_id: user.id, purchase: { purchase_option_id: movies.first.purchase_options.first.id } } }

    it 'returns purchase object' do
      expect(response).to match_response_schema('purchase')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(:created)
    end
  end

  context 'purchase something purchased in the past 2 days' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:movies) {FactoryBot.create_list(:movie, 20)}
    let!(:seasons) {FactoryBot.create_list(:season, 20)}
    let!(:purchase) {Purchase.create(purchase_option_id: movies.first.purchase_options.first.id, user_id: user.id, created_at: 1.day.ago)}
    before {
      post '/api/v1/purchases', params: { user_id: user.id, purchase: { purchase_option_id: movies.first.purchase_options.first.id } }
    }

    it 'returns status code 422' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

  end

  context 'purchase something purchased and expired' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:movies) {FactoryBot.create_list(:movie, 20)}
    let!(:seasons) {FactoryBot.create_list(:season, 20)}
    let!(:purchase) {Purchase.create(purchase_option_id: movies.first.purchase_options.first.id, user_id: user.id, created_at: 4.days.ago)}
    before {
      post '/api/v1/purchases', params: { user_id: user.id, purchase: { purchase_option_id: movies.first.purchase_options.first.id } }
    }

    it 'returns purchase object' do
      expect(response).to match_response_schema('purchase')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(:created)
    end

  end

end
