require 'spec_helper'

describe "andamentos/show" do
  before(:each) do
    @andamento = assign(:andamento, stub_model(Andamento,
      :processo => nil,
      :tipo_andamento => nil,
      :situacao => nil,
      :comentario => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
