require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FormaPagamentosController do

  # This should return the minimal set of attributes required to create a valid
  # FormaPagamento. As you add validations to FormaPagamento, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FormaPagamentosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all forma_pagamentos as @forma_pagamentos" do
      forma_pagamento = FormaPagamento.create! valid_attributes
      get :index, {}, valid_session
      assigns(:forma_pagamentos).should eq([forma_pagamento])
    end
  end

  describe "GET show" do
    it "assigns the requested forma_pagamento as @forma_pagamento" do
      forma_pagamento = FormaPagamento.create! valid_attributes
      get :show, {:id => forma_pagamento.to_param}, valid_session
      assigns(:forma_pagamento).should eq(forma_pagamento)
    end
  end

  describe "GET new" do
    it "assigns a new forma_pagamento as @forma_pagamento" do
      get :new, {}, valid_session
      assigns(:forma_pagamento).should be_a_new(FormaPagamento)
    end
  end

  describe "GET edit" do
    it "assigns the requested forma_pagamento as @forma_pagamento" do
      forma_pagamento = FormaPagamento.create! valid_attributes
      get :edit, {:id => forma_pagamento.to_param}, valid_session
      assigns(:forma_pagamento).should eq(forma_pagamento)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FormaPagamento" do
        expect {
          post :create, {:forma_pagamento => valid_attributes}, valid_session
        }.to change(FormaPagamento, :count).by(1)
      end

      it "assigns a newly created forma_pagamento as @forma_pagamento" do
        post :create, {:forma_pagamento => valid_attributes}, valid_session
        assigns(:forma_pagamento).should be_a(FormaPagamento)
        assigns(:forma_pagamento).should be_persisted
      end

      it "redirects to the created forma_pagamento" do
        post :create, {:forma_pagamento => valid_attributes}, valid_session
        response.should redirect_to(FormaPagamento.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved forma_pagamento as @forma_pagamento" do
        # Trigger the behavior that occurs when invalid params are submitted
        FormaPagamento.any_instance.stub(:save).and_return(false)
        post :create, {:forma_pagamento => { "name" => "invalid value" }}, valid_session
        assigns(:forma_pagamento).should be_a_new(FormaPagamento)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FormaPagamento.any_instance.stub(:save).and_return(false)
        post :create, {:forma_pagamento => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested forma_pagamento" do
        forma_pagamento = FormaPagamento.create! valid_attributes
        # Assuming there are no other forma_pagamentos in the database, this
        # specifies that the FormaPagamento created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FormaPagamento.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => forma_pagamento.to_param, :forma_pagamento => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested forma_pagamento as @forma_pagamento" do
        forma_pagamento = FormaPagamento.create! valid_attributes
        put :update, {:id => forma_pagamento.to_param, :forma_pagamento => valid_attributes}, valid_session
        assigns(:forma_pagamento).should eq(forma_pagamento)
      end

      it "redirects to the forma_pagamento" do
        forma_pagamento = FormaPagamento.create! valid_attributes
        put :update, {:id => forma_pagamento.to_param, :forma_pagamento => valid_attributes}, valid_session
        response.should redirect_to(forma_pagamento)
      end
    end

    describe "with invalid params" do
      it "assigns the forma_pagamento as @forma_pagamento" do
        forma_pagamento = FormaPagamento.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FormaPagamento.any_instance.stub(:save).and_return(false)
        put :update, {:id => forma_pagamento.to_param, :forma_pagamento => { "name" => "invalid value" }}, valid_session
        assigns(:forma_pagamento).should eq(forma_pagamento)
      end

      it "re-renders the 'edit' template" do
        forma_pagamento = FormaPagamento.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FormaPagamento.any_instance.stub(:save).and_return(false)
        put :update, {:id => forma_pagamento.to_param, :forma_pagamento => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested forma_pagamento" do
      forma_pagamento = FormaPagamento.create! valid_attributes
      expect {
        delete :destroy, {:id => forma_pagamento.to_param}, valid_session
      }.to change(FormaPagamento, :count).by(-1)
    end

    it "redirects to the forma_pagamentos list" do
      forma_pagamento = FormaPagamento.create! valid_attributes
      delete :destroy, {:id => forma_pagamento.to_param}, valid_session
      response.should redirect_to(forma_pagamentos_url)
    end
  end

end
