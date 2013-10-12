require 'spec_helper'

describe "acompanhamentos/new" do
  before(:each) do
    assign(:acompanhamento, stub_model(Acompanhamento,
      :contratos => nil,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new acompanhamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", acompanhamentos_path, "post" do
      assert_select "input#acompanhamento_contratos[name=?]", "acompanhamento[contratos]"
      assert_select "input#acompanhamento_name[name=?]", "acompanhamento[name]"
    end
  end
end
