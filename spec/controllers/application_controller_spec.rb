require 'spec_helper'

describe ApplicationController do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe 'After sign-in' do
    it 'redirects to the /sprints page' do
      controller.after_sign_in_path_for(@user).should == sprints_path
    end
  end

end