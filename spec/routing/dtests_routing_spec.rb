require "spec_helper"

describe DtestsController do
  describe "routing" do

    it "routes to #index" do
      get("/dtests").should route_to("dtests#index")
    end

    it "routes to #new" do
      get("/dtests/new").should route_to("dtests#new")
    end

    it "routes to #show" do
      get("/dtests/1").should route_to("dtests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dtests/1/edit").should route_to("dtests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dtests").should route_to("dtests#create")
    end

    it "routes to #update" do
      put("/dtests/1").should route_to("dtests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dtests/1").should route_to("dtests#destroy", :id => "1")
    end

  end
end
