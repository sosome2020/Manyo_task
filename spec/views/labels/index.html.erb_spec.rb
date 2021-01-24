require 'rails_helper'

RSpec.describe "labels/index", type: :view do
  before(:each) do
    assign(:labels, [
      Label.create!(
        name: "MyText"
      ),
      Label.create!(
        name: "MyText"
      )
    ])
  end

  it "renders a list of labels" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
