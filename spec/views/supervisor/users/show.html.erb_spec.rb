require "rails_helper"

describe "supervisor/users/show.html.erb" do
  let!(:user){create :supervisor}

  before do
    assign :user, user
    render
  end
  context "request to supervisor/users controller and show action" do
    it {expect(controller.request.path_parameters[:controller]).to eq "supervisor/users"}
    it {expect(controller.request.path_parameters[:action]).to eq "show"}
  end

  it "render" do
    expect(rendered).to have_content user.name
    expect(rendered).to have_content user.email
  end
end