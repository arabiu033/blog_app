require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users' } # get(:index)

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'renders a particular content' do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/:id' } # get(:show)

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'renders a particular content' do
      expect(response.body).to include('Here is a details information about a user')
    end
  end
end
