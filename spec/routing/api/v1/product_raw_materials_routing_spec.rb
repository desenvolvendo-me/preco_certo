# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::ProductRawMaterialsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/product_raw_materials").to route_to("api/v1/product_raw_materials#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/product_raw_materials/1").to route_to("api/v1/product_raw_materials#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/v1/product_raw_materials").to route_to("api/v1/product_raw_materials#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/product_raw_materials/1").to route_to("api/v1/product_raw_materials#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/product_raw_materials/1").to route_to("api/v1/product_raw_materials#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/product_raw_materials/1").to route_to("api/v1/product_raw_materials#destroy", id: "1")
    end
  end
end
