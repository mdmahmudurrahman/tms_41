require "rails_helper"

describe Supervisor::CoursesController do

  before do
    allow_any_instance_of(CanCan::ControllerResource).to receive(:authorize_resource)
  end

  describe "GET #index" do
    it "populates an array of all courses" do
      cse = create(:course, name: "CSE")
      eee = create(:course, name: "EEE")
      ce = create(:course, name: "CE")
      get :index
      expect(assigns(:courses)).to match_array([cse, eee, ce])
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end


  describe "GET #show" do
    it "assigns the requested course to @course" do
      course = create(:course)
      get :show, id: course
      expect(assigns(:course)).to eq course
    end
    it "renders the :show template" do
      course = create(:course)
      get :show, id: course
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new course to @course" do
      get :new
      expect(assigns(:course)).to be_a_new(Course)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested course to @course" do
      course = create(:course)
      get :edit, id: course
      expect(assigns(:course)).to eq course
    end
    it "renders the :edit template" do
      course = create(:course)
      get :edit, id: course
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new course in the database" do
        expect{
          post :create, course: attributes_for(:course)
        }.to change(Course, :count).by(1)
      end
      it "redirects to course#show" do
        post :create, course: attributes_for(:course)
        expect(response).to render_template :show
      end
    end
    context "with invalid attributes" do
      it "does not save the new course in the database" do
        expect{
          post :create, course: attributes_for(:invalid_course)
        }.not_to change(Course, :count)
      end
      it "re-renders the :new template" do
        post :create, course: attributes_for(:invalid_course)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @course = create(:course,
        name: "A name",
        description: Faker::Lorem.sentence,
        start_date: Faker::Time.between(2.years.ago, 1.year.ago),
        end_date: Faker::Time.between(1.year.ago, 1.week.ago),
        status: Course.statuses[:open])
    end

    context "valid attributes" do
      it "locates the requested @course" do
        patch :update, id: @course, course: attributes_for(:course)
        expect(assigns(:course)).to eq(@course)
      end
      it "changes @course's attributes" do
        patch :update, id: @course,
          course: attributes_for(:course, name: "Another name")
        @course.reload
        expect(@course.name).to eq("Another name")
      end
      it "redirects to the updated course" do
        patch :update, id: @course, course: attributes_for(:course)
        expect(response).to redirect_to [:supervisor, @course]
      end
    end
    context "with invalid attributes" do
      it "does not update the course" do
        patch :update, id: @course,
          course: attributes_for(:course, name: nil)
        @course.reload
        expect(@course.name).to eq("A name")
      end
      it "re-renders the :edit template" do
        patch :update, id: @course,
          course: attributes_for(:course, name: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @course = create(:course)
    end
    it "deletes the course from the database" do
      expect{
        delete :destroy, id: @course
      }.to change(Course,:count).by(-1)
    end
    it "redirects to users#index" do
      delete :destroy, id: @course
      expect(response).to redirect_to supervisor_courses_path
    end
  end
end