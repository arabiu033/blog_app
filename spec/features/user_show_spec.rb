require 'rails_helper'
​
RSpec.describe 'User world', type: :system do
  describe 'show page' do
    subject { FactoryGirl.create(:user) }
    before do
      5.times do
        FactoryGirl.create(:post, :author => subject)
      end
    end
    it 'shows the right content' do
      visit user_path(subject)
      expect(page).to have_content(subject.name.split(' ')[-1])
      expect(page).to have_xpath('//img')
      expect(page).to have_content("Number of posts: 5")
      expect(page).to have_content("bio")
      expect(page).to have_content(Post.find(1).title)
      expect(page).to have_content(Post.find(2).title)
      expect(page).to have_content(Post.find(3).title)
      expect(find_link('See all posts').visible?).to be true
      click_link('See all posts')
      sleep(2)
      expect(page).to have_current_path(user_posts_path(subject))
    end
  end
end
