require 'spec_helper'

describe "centro_custos/show" do
  before(:each) do
    @centro_custo = assign(:centro_custo, stub_model(CentroCusto,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
