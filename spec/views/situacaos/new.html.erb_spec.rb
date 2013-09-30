require 'spec_helper'

describe "situacaos/new" do
  before(:each) do
    assign(:situacao, stub_model(Situacao,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new situacao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", situacaos_path, "post" do
      assert_select "input#situacao_name[name=?]", "situacao[name]"
    end
  end
end
