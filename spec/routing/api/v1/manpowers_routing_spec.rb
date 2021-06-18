# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::ManpowersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/manpowers").to route_to("api/v1/manpowers#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/manpowers/1").to route_to("api/v1/manpowers#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/v1/manpowers").to route_to("api/v1/manpowers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/manpowers/1").to route_to("api/v1/manpowers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/manpowers/1").to route_to("api/v1/manpowers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/manpowers/1").to route_to("api/v1/manpowers#destroy", id: "1")
    end
  end
end
