require 'spec_helper'

describe "tipo_processos/show" do
  before(:each) do
    @tipo_processo = assign(:tipo_processo, stub_model(TipoProcesso,
      :name => "Name",
      :formato => "Formato"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Formato/)
  end
end
