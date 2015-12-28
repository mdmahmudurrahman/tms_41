require "rails_helper"

describe Supervisor::UsersCoursesController do
   let!(:user){create :user}
   let!(:course){create :course}

  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return user
    @course = create(:course)
    @user_ids = User.all.ids
  end

   describe "GET #show" do
     context "Get Show successfully" do
       it {expect(response).to be_success}
       it {expect(response).to have_http_status :ok}
       it "renders the :show template" do
         get :show, id: course
         expect(response).to render_template :show
       end
     end
   end

   describe "can PATCH #update" do
     it "update" do
       patch :update, id: @course, course: attributes_for(:course, user_ids: @user_ids)
       expect(response).to redirect_to [:supervisor, @course]
     end
   end
end