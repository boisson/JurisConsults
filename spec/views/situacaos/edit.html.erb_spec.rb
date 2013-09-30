require 'spec_helper'

describe "situacaos/edit" do
  before(:each) do
    @situacao = assign(:situacao, stub_model(Situacao,
      :name => "MyString"
    ))
  end

  it "renders the edit situacao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", situacao_path(@situacao), "post" do
      assert_select "input#situacao_name[name=?]", "situacao[name]"
    end
  end
end
