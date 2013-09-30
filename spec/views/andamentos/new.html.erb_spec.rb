require 'spec_helper'

describe "andamentos/new" do
  before(:each) do
    assign(:andamento, stub_model(Andamento,
      :processo => nil,
      :tipo_andamento => nil,
      :situacao => nil,
      :comentario => "MyText"
    ).as_new_record)
  end

  it "renders new andamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", andamentos_path, "post" do
      assert_select "input#andamento_processo[name=?]", "andamento[processo]"
      assert_select "input#andamento_tipo_andamento[name=?]", "andamento[tipo_andamento]"
      assert_select "input#andamento_situacao[name=?]", "andamento[situacao]"
      assert_select "textarea#andamento_comentario[name=?]", "andamento[comentario]"
    end
  end
end
