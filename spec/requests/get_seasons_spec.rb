require 'rails_helper'
describe 'get all seasons route', :type => :request do
  let!(:seasons) {FactoryBot.create_list(:season, 20)}
  before { get '/api/v1/seasons' }
  it 'returns all seasons' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
  it 'returns them ordered by creation (descending)' do
    expect(JSON.parse(response.body).each_cons(2).all? {|a, b| a['created_at'] >= b['created_at'] }).to be_truthy
  end
  it 'returns the 12 episodes per season we defined' do
    expect(JSON.parse(response.body)[0]['episodes'].size).to eq(12)
  end
  it 'returns the episodes ordered by number (ascending)' do
    expect(JSON.parse(response.body)[0]['episodes'].each_cons(2).all? {|a, b| a['number'] <= b['number'] }).to be_truthy
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
