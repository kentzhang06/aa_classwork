require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    #pending "add some examples (or delete) #{__FILE__}"
    it 'renders the users index template' do 
      get :index 
      expect(response).to render_template(:index)
    end 
  end

  describe "GET /show" do
    #pending "add some examples (or delete) #{__FILE__}"
    it 'renders the users show template' do 
      get :show 
      expect(response).to render_template(:show)
    end 
  end

  describe "GET /new" do
    #pending "add some examples (or delete) #{__FILE__}"
    it 'renders the users new template' do 
      get :new 
      expect(response).to render_template(:new)
    end 
  end

  describe "POST /create" do
    #pending "add some examples (or delete) #{__FILE__}"
    context 'with valid params' do 
      let(:user_params) do {
        user: {
          username: 'Kent',
          password: 'password100'
        }
      }
      
      end 
      
      it 'logs in the user' do 
        post :create, params: user_params 
        user = User.find_by(username: 'Kent')
        expect(session[:session_token]. to eq(user.session_token))
      end 

      it 'redirects to the users show page' do 
        post :create, params: user_params 
        user = User.find_by(username: 'Kent')
        expect(response).to redirect_to(user_url(user))
      end 
    end 

    context 'with invalid params' do
      it 'validates presence of username, password, and renders the new template with errors' do
        post :create, params: {user: {username: 'Snigdha', password: ''}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present 
      end 

      
    end 

  end

  describe "GET /edit" do
    #pending "add some examples (or delete) #{__FILE__}"
    it 'renders the users edit template' do 
      get :edit 
      expect(response).to render_template(:edit)
    end 
  end

  describe "PATCH /update" do
    context 'with valid params' do 
      let(:user_params) do {
        user: {
          username: 'Kent',
          password: 'password100'
        }
      }
      end 
      it 'updates the user' do
        FactoryBot.create(:user, username: 'Kent2')
        patch :update, params: {id: user.id, user: { username: "Kent123"}}
        user2 = User.find_by(id: user.id)
        
        expect(user2.username).to eq('Kent123')
      end 
      it 'redirects to the users show page' do 
        post :create, params: user_params 
        user = User.find_by(username: 'Kent')
        expect(response).to redirect_to(user_url(user))
      end 
    end 

    context 'with invalid params' do
      it 'validates presence of username, password, and renders the new template with errors' do
        post :create, params: {user: {username: 'Snigdha', password: ''}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present 
      end 

      
    end  
  end
end
