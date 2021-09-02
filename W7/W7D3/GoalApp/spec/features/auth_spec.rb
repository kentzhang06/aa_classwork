require 'rails_helper'

feature 'Sign Up' do 
    background :each do 
        visit new_user_path 
    end 

    scenario 'has a user sign up page' do 
        expect(page).to have_content('Sign Up')
    end 

    scenario 'takes an username, email, password' do
        expect(page).to have_content('Username')
        expect(page).to have_content('Password')
        expect(page).to have_content('Email')
    end 
end 