require "spec_helper"

describe DanswersController do
  describe "routing" do

    it "routes to #index" do
      get("/danswers").should route_to("danswers#index")
    end

    it "routes to #new" do
      get("/danswers/new").should route_to("danswers#new")
    end

    it "routes to #show" do
      get("/danswers/1").should route_to("danswers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/danswers/1/edit").should route_to("danswers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/danswers").should route_to("danswers#create")
    end

    it "routes to #update" do
      put("/danswers/1").should route_to("danswers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/danswers/1").should route_to("danswers#destroy", :id => "1")
    end

  end
end
