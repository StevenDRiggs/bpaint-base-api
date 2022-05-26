require "rails_helper"

RSpec.describe AnalogColorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/analog_colors").to route_to("analog_colors#index")
    end

    it "routes to #show" do
      expect(get: "/analog_colors/1").to route_to("analog_colors#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/analog_colors").to route_to("analog_colors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/analog_colors/1").to route_to("analog_colors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/analog_colors/1").to route_to("analog_colors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/analog_colors/1").to route_to("analog_colors#destroy", id: "1")
    end
  end
end
