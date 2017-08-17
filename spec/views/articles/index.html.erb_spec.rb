require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :url => "Url",
        :title => "Title",
        :opening => "MyText",
        :Report => Report.create!
      ),
      Article.create!(
        :url => "Url",
        :title => "Title",
        :opening => "MyText",
        :Report => Report.create!
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    #assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
