require 'rails_helper'

RSpec.describe 'User post', type: :system do
  describe 'index page' do
    subject { FactoryGirl.create(:post, author: FactoryGirl.create(:user)) }
    before do
      5.times do
        FactoryGirl.create(:comment, author: subject.author, post: subject)
        FactoryGirl.create(:like, author: subject.author, post: subject)
      end
    end
    it 'shows the right content' do
      visit user_posts_path(subject.author)
      sleep(2)
      expect(page).to have_content(subject.author.name.split[-1])
      expect(page).to have_xpath('//img')
      expect(page).to have_content('Number of posts: 1')
      expect(page).to have_content(subject.title)
      expect(page).to have_content(subject.text)
      subject.post_comments.each do |comment|
        expect(page).to have_content(comment.text.split[0])
      end
      expect(page).to have_content('Comments: 5')
      expect(page).to have_content('Likes: 5')
      expect(find_link('Pagination').visible?).to be true
      click_link(subject.title)
      sleep(2)
      expect(page).to have_current_path(user_post_path(subject.author, subject))
    end
  end
end
