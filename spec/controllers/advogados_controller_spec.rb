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

describe AdvogadosController do

  # This should return the minimal set of attributes required to create a valid
  # Advogado. As you add validations to Advogado, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AdvogadosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all advogados as @advogados" do
      advogado = Advogado.create! valid_attributes
      get :index, {}, valid_session
      assigns(:advogados).should eq([advogado])
    end
  end

  describe "GET show" do
    it "assigns the requested advogado as @advogado" do
      advogado = Advogado.create! valid_attributes
      get :show, {:id => advogado.to_param}, valid_session
      assigns(:advogado).should eq(advogado)
    end
  end

  describe "GET new" do
    it "assigns a new advogado as @advogado" do
      get :new, {}, valid_session
      assigns(:advogado).should be_a_new(Advogado)
    end
  end

  describe "GET edit" do
    it "assigns the requested advogado as @advogado" do
      advogado = Advogado.create! valid_attributes
      get :edit, {:id => advogado.to_param}, valid_session
      assigns(:advogado).should eq(advogado)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Advogado" do
        expect {
          post :create, {:advogado => valid_attributes}, valid_session
        }.to change(Advogado, :count).by(1)
      end

      it "assigns a newly created advogado as @advogado" do
        post :create, {:advogado => valid_attributes}, valid_session
        assigns(:advogado).should be_a(Advogado)
        assigns(:advogado).should be_persisted
      end

      it "redirects to the created advogado" do
        post :create, {:advogado => valid_attributes}, valid_session
        response.should redirect_to(Advogado.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved advogado as @advogado" do
        # Trigger the behavior that occurs when invalid params are submitted
        Advogado.any_instance.stub(:save).and_return(false)
        post :create, {:advogado => { "name" => "invalid value" }}, valid_session
        assigns(:advogado).should be_a_new(Advogado)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Advogado.any_instance.stub(:save).and_return(false)
        post :create, {:advogado => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested advogado" do
        advogado = Advogado.create! valid_attributes
        # Assuming there are no other advogados in the database, this
        # specifies that the Advogado created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Advogado.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => advogado.to_param, :advogado => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested advogado as @advogado" do
        advogado = Advogado.create! valid_attributes
        put :update, {:id => advogado.to_param, :advogado => valid_attributes}, valid_session
        assigns(:advogado).should eq(advogado)
      end

      it "redirects to the advogado" do
        advogado = Advogado.create! valid_attributes
        put :update, {:id => advogado.to_param, :advogado => valid_attributes}, valid_session
        response.should redirect_to(advogado)
      end
    end

    describe "with invalid params" do
      it "assigns the advogado as @advogado" do
        advogado = Advogado.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Advogado.any_instance.stub(:save).and_return(false)
        put :update, {:id => advogado.to_param, :advogado => { "name" => "invalid value" }}, valid_session
        assigns(:advogado).should eq(advogado)
      end

      it "re-renders the 'edit' template" do
        advogado = Advogado.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Advogado.any_instance.stub(:save).and_return(false)
        put :update, {:id => advogado.to_param, :advogado => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested advogado" do
      advogado = Advogado.create! valid_attributes
      expect {
        delete :destroy, {:id => advogado.to_param}, valid_session
      }.to change(Advogado, :count).by(-1)
    end

    it "redirects to the advogados list" do
      advogado = Advogado.create! valid_attributes
      delete :destroy, {:id => advogado.to_param}, valid_session
      response.should redirect_to(advogados_url)
    end
  end

end
