require 'spec_helper'

describe "acompanhamentos/edit" do
  before(:each) do
    @acompanhamento = assign(:acompanhamento, stub_model(Acompanhamento,
      :contratos => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit acompanhamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", acompanhamento_path(@acompanhamento), "post" do
      assert_select "input#acompanhamento_contratos[name=?]", "acompanhamento[contratos]"
      assert_select "input#acompanhamento_name[name=?]", "acompanhamento[name]"
    end
  end
end
