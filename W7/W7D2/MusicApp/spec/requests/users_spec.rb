require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #new" do
    it "renders the new template" do
      get "/users/new", {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post "/users", params: {user: {email: "kzhang123@yahoo.com", password: "" } }
        expect(response). to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post "/users", params: { user: {email: "kzhang123@yahoo.com", password: "too" } }
        expect(response). to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user to bands index on success" do
        post "/users", params: { user: { email: "kzhang123@yahoo.com", password: "password123" } }
        expect(response).to redirect_to(bands_url)
      end
    end
  end
end
