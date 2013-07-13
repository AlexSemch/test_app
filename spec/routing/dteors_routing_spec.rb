require "spec_helper"

describe DteorsController do
  describe "routing" do

    it "routes to #index" do
      get("/dteors").should route_to("dteors#index")
    end

    it "routes to #new" do
      get("/dteors/new").should route_to("dteors#new")
    end

    it "routes to #show" do
      get("/dteors/1").should route_to("dteors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dteors/1/edit").should route_to("dteors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dteors").should route_to("dteors#create")
    end

    it "routes to #update" do
      put("/dteors/1").should route_to("dteors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dteors/1").should route_to("dteors#destroy", :id => "1")
    end

  end
end
