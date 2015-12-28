require "rails_helper"

describe Supervisor::CourseSubjectsController do
  let(:supervisor){create :supervisor}
  let(:course){create :course}
  let(:subject){create :subject}
  let(:coursesubject){create :course_subject}
  before do
    sign_in supervisor
    allow(controller).to receive(:current_user).and_return supervisor
  end

  describe "GET Edit" do
    before do
      allow(Course).to receive(:find).and_return course
      allow(Subject).to receive(:find).and_return subject
      get :edit, id: coursesubject
    end

    it {expect(response).to be_success}
    it {expect(response).to have_http_status 200}
    it {expect(response).to render_template :edit}
  end

end