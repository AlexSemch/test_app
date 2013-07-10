require "spec_helper"

describe DthemsController do
  describe "routing" do

    it "routes to #index" do
      get("/dthems").should route_to("dthems#index")
    end

    it "routes to #new" do
      get("/dthems/new").should route_to("dthems#new")
    end

    it "routes to #show" do
      get("/dthems/1").should route_to("dthems#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dthems/1/edit").should route_to("dthems#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dthems").should route_to("dthems#create")
    end

    it "routes to #update" do
      put("/dthems/1").should route_to("dthems#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dthems/1").should route_to("dthems#destroy", :id => "1")
    end

  end
end
