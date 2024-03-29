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

describe ContaCorrentesController do

  # This should return the minimal set of attributes required to create a valid
  # ContaCorrente. As you add validations to ContaCorrente, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "date" => "2013-10-04 14:56:08" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContaCorrentesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all conta_correntes as @conta_correntes" do
      conta_corrente = ContaCorrente.create! valid_attributes
      get :index, {}, valid_session
      assigns(:conta_correntes).should eq([conta_corrente])
    end
  end

  describe "GET show" do
    it "assigns the requested conta_corrente as @conta_corrente" do
      conta_corrente = ContaCorrente.create! valid_attributes
      get :show, {:id => conta_corrente.to_param}, valid_session
      assigns(:conta_corrente).should eq(conta_corrente)
    end
  end

  describe "GET new" do
    it "assigns a new conta_corrente as @conta_corrente" do
      get :new, {}, valid_session
      assigns(:conta_corrente).should be_a_new(ContaCorrente)
    end
  end

  describe "GET edit" do
    it "assigns the requested conta_corrente as @conta_corrente" do
      conta_corrente = ContaCorrente.create! valid_attributes
      get :edit, {:id => conta_corrente.to_param}, valid_session
      assigns(:conta_corrente).should eq(conta_corrente)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ContaCorrente" do
        expect {
          post :create, {:conta_corrente => valid_attributes}, valid_session
        }.to change(ContaCorrente, :count).by(1)
      end

      it "assigns a newly created conta_corrente as @conta_corrente" do
        post :create, {:conta_corrente => valid_attributes}, valid_session
        assigns(:conta_corrente).should be_a(ContaCorrente)
        assigns(:conta_corrente).should be_persisted
      end

      it "redirects to the created conta_corrente" do
        post :create, {:conta_corrente => valid_attributes}, valid_session
        response.should redirect_to(ContaCorrente.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved conta_corrente as @conta_corrente" do
        # Trigger the behavior that occurs when invalid params are submitted
        ContaCorrente.any_instance.stub(:save).and_return(false)
        post :create, {:conta_corrente => { "date" => "invalid value" }}, valid_session
        assigns(:conta_corrente).should be_a_new(ContaCorrente)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ContaCorrente.any_instance.stub(:save).and_return(false)
        post :create, {:conta_corrente => { "date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested conta_corrente" do
        conta_corrente = ContaCorrente.create! valid_attributes
        # Assuming there are no other conta_correntes in the database, this
        # specifies that the ContaCorrente created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ContaCorrente.any_instance.should_receive(:update_attributes).with({ "date" => "2013-10-04 14:56:08" })
        put :update, {:id => conta_corrente.to_param, :conta_corrente => { "date" => "2013-10-04 14:56:08" }}, valid_session
      end

      it "assigns the requested conta_corrente as @conta_corrente" do
        conta_corrente = ContaCorrente.create! valid_attributes
        put :update, {:id => conta_corrente.to_param, :conta_corrente => valid_attributes}, valid_session
        assigns(:conta_corrente).should eq(conta_corrente)
      end

      it "redirects to the conta_corrente" do
        conta_corrente = ContaCorrente.create! valid_attributes
        put :update, {:id => conta_corrente.to_param, :conta_corrente => valid_attributes}, valid_session
        response.should redirect_to(conta_corrente)
      end
    end

    describe "with invalid params" do
      it "assigns the conta_corrente as @conta_corrente" do
        conta_corrente = ContaCorrente.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ContaCorrente.any_instance.stub(:save).and_return(false)
        put :update, {:id => conta_corrente.to_param, :conta_corrente => { "date" => "invalid value" }}, valid_session
        assigns(:conta_corrente).should eq(conta_corrente)
      end

      it "re-renders the 'edit' template" do
        conta_corrente = ContaCorrente.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ContaCorrente.any_instance.stub(:save).and_return(false)
        put :update, {:id => conta_corrente.to_param, :conta_corrente => { "date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested conta_corrente" do
      conta_corrente = ContaCorrente.create! valid_attributes
      expect {
        delete :destroy, {:id => conta_corrente.to_param}, valid_session
      }.to change(ContaCorrente, :count).by(-1)
    end

    it "redirects to the conta_correntes list" do
      conta_corrente = ContaCorrente.create! valid_attributes
      delete :destroy, {:id => conta_corrente.to_param}, valid_session
      response.should redirect_to(conta_correntes_url)
    end
  end

end
