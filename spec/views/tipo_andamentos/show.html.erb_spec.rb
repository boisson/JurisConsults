require 'spec_helper'

describe "tipo_andamentos/show" do
  before(:each) do
    @tipo_andamento = assign(:tipo_andamento, stub_model(TipoAndamento,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
