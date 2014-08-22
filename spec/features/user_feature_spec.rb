require 'rails_helper'

describe 'users' do

	before(:each) {@eddie = User.create(email: 'eddie_andress@hotmail.com', user_name: 'eandress' ,password: '12345678', password_confirmation: '12345678')} 

	context 'when not logged in' do
		it 'have the option to log in' do
			visit '/posts'
			expect(page).to have_content('Sign in')
		end
	end

	context 'when logged in' do
		it 'see a greeting message and have the option to log out' do
			login_as(@eddie)
			expect(page).to have_content('Sign out')
		end
	end

end
