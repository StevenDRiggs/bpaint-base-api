require "rails_helper"

RSpec.describe DigitalColorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/digital_colors").to route_to("digital_colors#index")
    end

    it "routes to #show" do
      expect(get: "/digital_colors/1").to route_to("digital_colors#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/digital_colors").to route_to("digital_colors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/digital_colors/1").to route_to("digital_colors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/digital_colors/1").to route_to("digital_colors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/digital_colors/1").to route_to("digital_colors#destroy", id: "1")
    end
  end
end
