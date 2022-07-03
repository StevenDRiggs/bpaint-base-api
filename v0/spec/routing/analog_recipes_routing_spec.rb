require "rails_helper"

RSpec.describe AnalogRecipesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/analog_recipes").to route_to("analog_recipes#index")
    end

    it "routes to #show" do
      expect(get: "/analog_recipes/1").to route_to("analog_recipes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/analog_recipes").to route_to("analog_recipes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/analog_recipes/1").to route_to("analog_recipes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/analog_recipes/1").to route_to("analog_recipes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/analog_recipes/1").to route_to("analog_recipes#destroy", id: "1")
    end
  end
end
