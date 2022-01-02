require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/analog_colors", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # AnalogColor. As you add validations to AnalogColor, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # AnalogColorsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      AnalogColor.create! valid_attributes
      get analog_colors_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      analog_color = AnalogColor.create! valid_attributes
      get analog_color_url(analog_color), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new AnalogColor" do
        expect {
          post analog_colors_url,
               params: { analog_color: valid_attributes }, headers: valid_headers, as: :json
        }.to change(AnalogColor, :count).by(1)
      end

      it "renders a JSON response with the new analog_color" do
        post analog_colors_url,
             params: { analog_color: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new AnalogColor" do
        expect {
          post analog_colors_url,
               params: { analog_color: invalid_attributes }, as: :json
        }.to change(AnalogColor, :count).by(0)
      end

      it "renders a JSON response with errors for the new analog_color" do
        post analog_colors_url,
             params: { analog_color: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested analog_color" do
        analog_color = AnalogColor.create! valid_attributes
        patch analog_color_url(analog_color),
              params: { analog_color: new_attributes }, headers: valid_headers, as: :json
        analog_color.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the analog_color" do
        analog_color = AnalogColor.create! valid_attributes
        patch analog_color_url(analog_color),
              params: { analog_color: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the analog_color" do
        analog_color = AnalogColor.create! valid_attributes
        patch analog_color_url(analog_color),
              params: { analog_color: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested analog_color" do
      analog_color = AnalogColor.create! valid_attributes
      expect {
        delete analog_color_url(analog_color), headers: valid_headers, as: :json
      }.to change(AnalogColor, :count).by(-1)
    end
  end
end
