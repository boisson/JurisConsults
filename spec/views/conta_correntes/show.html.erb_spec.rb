require 'spec_helper'

describe "conta_correntes/show" do
  before(:each) do
    @conta_corrente = assign(:conta_corrente, stub_model(ContaCorrente,
      :contrato => nil,
      :valor => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1.5/)
  end
end
