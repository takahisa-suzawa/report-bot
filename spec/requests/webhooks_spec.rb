require 'rails_helper'

RSpec.describe "Webhooks", type: :request do

  describe "POST /api/v1/webhook helpが投稿されたパターン" do
    before do
      @params = FactoryGirl.attributes_for(:url_help)
    end
    
    it '200が返ってくる' do
      post '/api/v1/webhook', params: @params
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'webhookレコードが1増える' do
      expect { post '/api/v1/webhook', params: @params }.to change(Webhook, :count).by(1)
    end
  end

  describe "POST /api/v1/webhook URLが投稿されたパターン" do
    before do
      @params = FactoryGirl.attributes_for(:url_post)
    end
    
    it '200が返ってくる' do
      post '/api/v1/webhook', params: @params
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'webhookレコードが1増える' do
      expect { post '/api/v1/webhook', params: @params }.to change(Webhook, :count).by(1)
    end
  end
end
