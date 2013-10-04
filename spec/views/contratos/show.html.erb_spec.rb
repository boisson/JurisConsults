require 'spec_helper'

describe "contratos/show" do
  before(:each) do
    @contrato = assign(:contrato, stub_model(Contrato,
      :name => "Name",
      :processo => nil,
      :valor => 1.5,
      :forma_pagamento => nil,
      :saldo => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/1.5/)
    rendered.should match(//)
    rendered.should match(/1.5/)
  end
end
