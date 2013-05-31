require "spec_helper"

describe DquestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/dquestions").should route_to("dquestions#index")
    end

    it "routes to #new" do
      get("/dquestions/new").should route_to("dquestions#new")
    end

    it "routes to #show" do
      get("/dquestions/1").should route_to("dquestions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dquestions/1/edit").should route_to("dquestions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dquestions").should route_to("dquestions#create")
    end

    it "routes to #update" do
      put("/dquestions/1").should route_to("dquestions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dquestions/1").should route_to("dquestions#destroy", :id => "1")
    end

  end
end
