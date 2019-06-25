require 'rails_helper'
describe "get user's titles route", :type => :request do
  let!(:movies) {FactoryBot.create_list(:movie, 20)}
  let!(:seasons) {FactoryBot.create_list(:season, 20)}
  let!(:user) {FactoryBot.create(:user_with_content)}

  before { get "/api/v1/library?user_id=#{user.id}" }

  it 'returns just the 5 active titles' do
    expect(JSON.parse(response.body).size).to eq(5)
  end
  it 'returns them ordered by remaining time (descending)' do
    expect(JSON.parse(response.body).each_cons(2).all? {|a, b| a['created_at'] >= b['created_at'] }).to be_truthy
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end
