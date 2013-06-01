module ControllerHelpers
  def with_a_signed_in_user(&block)
    context "with a signed in user" do
      let(:user) { FactoryGirl.create :user }

      before :each do
        sign_in user
      end

      instance_eval &block
    end
  end
end
