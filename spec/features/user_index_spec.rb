require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    before(:all) do
      5.times do
        FactoryGirl.create(:user)
      end
    end
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content(User.first.name.split[-1])
      expect(page).to have_xpath('//img')
      expect(page).to have_content('Number of posts: 0')
      click_link(User.first.name.split[-1])
      sleep(2)
      expect(page).to have_content('bio')
    end
  end
end
