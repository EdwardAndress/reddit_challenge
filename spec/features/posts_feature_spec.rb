require 'rails_helper'

describe 'posts' do

	before(:each) {Post.create(title: 'A new post', content: 'to test the homepage')}

	it 'ensure database cleaner is working' do
		expect(Post.count).to eq(1)
	end

	context 'site visitors can browse posts' do 

		it 'on the home page' do 
			visit '/posts'
			expect(page).to have_content('A new post')
		end

	end
	
	context 'can be added by following a link' do

			it 'for text based posts' do 
				visit '/posts'
				click_link('Submit a new text post')
				fill_in 'Title', with: 'Another post'
				fill_in 'Content', with: 'to test drive users adding text based posts'
				click_button('Submit post')
				expect(current_path).to eq('/posts')
				expect(page).to have_content('Another post')
			end

			it 'for link-based posts' do
				visit '/posts'
				click_link('Submit a new link')
				fill_in 'Title', with: 'A link post'
				fill_in 'Url', with: 'www.google.co.uk'
				click_button('Submit post')
				expect(current_path).to eq('/posts')
				expect(page).to have_link('A link post')
			end

	end

	context 'can be voted upon' do 

		before(:each) {@post = Post.new(title: 'Upvote test', content: 'I have 1 upvote')}

		it 'positively' do
			visit '/posts'
			click_link '▲'
			expect(@post.upvotes).to eq(1)
		end

	end

end