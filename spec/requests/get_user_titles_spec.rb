require 'rails_helper'
describe "get user's titles route", :type => :request do
  let!(:movies) {FactoryBot.create_list(:movie, 20)}
  let!(:seasons) {FactoryBot.create_list(:season, 20)}
  let!(:user) {FactoryBot.create(:user_with_content)}
  #let!(:active_purchases) {FactoryBot.create_list(:purchase, 5, user: user, purchase_options: (Movie.order(:id).limit(5).map { |m| m.purchase_options.sample }) )}
  #let!(:past_purchases) {FactoryBot.create_list(:purchase, 10, user: user, purchase_options: (Movie.order(:id).limit(10).offset.map { |m| m.purchase_options.sample }), created_at: 5.days.ago)}

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
