require "rails_helper"

RSpec.describe "Posts", :type => :request do
  describe 'GET #index' do
    before(:example) { get '/users/:user_id/posts' }  # get(:index)

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it "renders a particular content" do
      expect(response.body).to include("Here is a list of posts for a given user")
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/:user_id/posts/:id' }  # get(:show)

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it "renders a particular content" do
      expect(response.body).to include("Here is a full detail about a user post")
    end
     
  end
end