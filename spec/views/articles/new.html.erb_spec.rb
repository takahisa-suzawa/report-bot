require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :url => "MyString",
      :title => "MyString",
      :opening => "MyText",
      :Report => Report.create!
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[url]"

      assert_select "input[name=?]", "article[title]"

      assert_select "textarea[name=?]", "article[opening]"

      #assert_select "input[name=?]", "article[Report_id]"
    end
  end
end
