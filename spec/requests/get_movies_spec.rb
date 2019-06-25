require 'rails_helper'
describe 'get all movies route', :type => :request do
  let!(:movies) {FactoryBot.create_list(:movie, 20)}
  before { get '/api/v1/movies' }
  it 'returns all movies' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
  it 'returns them ordered by creation (descending)' do
    expect(JSON.parse(response.body).each_cons(2).all? {|a, b| a['created_at'] >= b['created_at'] }).to be_truthy
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
