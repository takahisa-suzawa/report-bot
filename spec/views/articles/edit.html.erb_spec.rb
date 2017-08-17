require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:articles, 
      Article.create!(
        :url => "Url",
        :title => "Title",
        :opening => "MyText",
        :Report => Report.create!
      )
    )
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input[name=?]", "article[url]"

      assert_select "input[name=?]", "article[title]"

      assert_select "textarea[name=?]", "article[opening]"

      #assert_select "input[name=?]", "article[Report_id]"
    end
  end
end
