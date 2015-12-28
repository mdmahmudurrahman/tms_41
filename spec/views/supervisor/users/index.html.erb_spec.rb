require "rails_helper"

describe "supervisor/users/index.html.erb" do
  subject {rendered}
  let(:user){create :user}
  let(:users){User.supervisor}

  context "request to supervisor/users controller and index action" do
    it {expect(controller.request.path_parameters[:controller]).to eq "supervisor/users"}
    it {expect(controller.request.path_parameters[:action]).to eq "index"}
  end

  it "render" do
    users.each do |user|
      expect(rendered).to have_content user.name
      expect(rendered).to have_content user.email
    end
  end
end