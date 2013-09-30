require 'spec_helper'

describe "processos/show" do
  before(:each) do
    @processo = assign(:processo, stub_model(Processo,
      :numero => "Numero",
      :ano => "Ano",
      :cliente => nil,
      :reu => nil,
      :advogado => nil,
      :local => nil,
      :tipo_processo => nil,
      :custas => 1.5,
      :honorarios => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Numero/)
    rendered.should match(/Ano/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
