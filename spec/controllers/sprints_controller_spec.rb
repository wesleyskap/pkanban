require 'spec_helper'

describe SprintsController do
  with_a_signed_in_user do
    let(:sprint)  { FactoryGirl.create(:sprint) }

    describe "GET index" do
      it "should html respond 200" do
        get :index, format: :html
        response.status.should be(200)
      end

      it "should json respond 200" do
        get :index, format: :json
        response.status.should be(200)
      end

      it "should xml respond 406 (Not Acceptable)" do
        get :index, format: :xml
        response.status.should be(406)
      end
    end

    describe "GET new" do
      it "should respond ok" do
        get :new
        assigns(:sprint).should be_a_new(Sprint)
      end
    end
  end
end
