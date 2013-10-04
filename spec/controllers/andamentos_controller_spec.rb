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

describe AndamentosController do

  # This should return the minimal set of attributes required to create a valid
  # Andamento. As you add validations to Andamento, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "processo" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AndamentosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all andamentos as @andamentos" do
      andamento = Andamento.create! valid_attributes
      get :index, {}, valid_session
      assigns(:andamentos).should eq([andamento])
    end
  end

  describe "GET show" do
    it "assigns the requested andamento as @andamento" do
      andamento = Andamento.create! valid_attributes
      get :show, {:id => andamento.to_param}, valid_session
      assigns(:andamento).should eq(andamento)
    end
  end

  describe "GET new" do
    it "assigns a new andamento as @andamento" do
      get :new, {}, valid_session
      assigns(:andamento).should be_a_new(Andamento)
    end
  end

  describe "GET edit" do
    it "assigns the requested andamento as @andamento" do
      andamento = Andamento.create! valid_attributes
      get :edit, {:id => andamento.to_param}, valid_session
      assigns(:andamento).should eq(andamento)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Andamento" do
        expect {
          post :create, {:andamento => valid_attributes}, valid_session
        }.to change(Andamento, :count).by(1)
      end

      it "assigns a newly created andamento as @andamento" do
        post :create, {:andamento => valid_attributes}, valid_session
        assigns(:andamento).should be_a(Andamento)
        assigns(:andamento).should be_persisted
      end

      it "redirects to the created andamento" do
        post :create, {:andamento => valid_attributes}, valid_session
        response.should redirect_to(Andamento.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved andamento as @andamento" do
        # Trigger the behavior that occurs when invalid params are submitted
        Andamento.any_instance.stub(:save).and_return(false)
        post :create, {:andamento => { "processo" => "invalid value" }}, valid_session
        assigns(:andamento).should be_a_new(Andamento)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Andamento.any_instance.stub(:save).and_return(false)
        post :create, {:andamento => { "processo" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested andamento" do
        andamento = Andamento.create! valid_attributes
        # Assuming there are no other andamentos in the database, this
        # specifies that the Andamento created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Andamento.any_instance.should_receive(:update_attributes).with({ "processo" => "" })
        put :update, {:id => andamento.to_param, :andamento => { "processo" => "" }}, valid_session
      end

      it "assigns the requested andamento as @andamento" do
        andamento = Andamento.create! valid_attributes
        put :update, {:id => andamento.to_param, :andamento => valid_attributes}, valid_session
        assigns(:andamento).should eq(andamento)
      end

      it "redirects to the andamento" do
        andamento = Andamento.create! valid_attributes
        put :update, {:id => andamento.to_param, :andamento => valid_attributes}, valid_session
        response.should redirect_to(andamento)
      end
    end

    describe "with invalid params" do
      it "assigns the andamento as @andamento" do
        andamento = Andamento.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Andamento.any_instance.stub(:save).and_return(false)
        put :update, {:id => andamento.to_param, :andamento => { "processo" => "invalid value" }}, valid_session
        assigns(:andamento).should eq(andamento)
      end

      it "re-renders the 'edit' template" do
        andamento = Andamento.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Andamento.any_instance.stub(:save).and_return(false)
        put :update, {:id => andamento.to_param, :andamento => { "processo" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested andamento" do
      andamento = Andamento.create! valid_attributes
      expect {
        delete :destroy, {:id => andamento.to_param}, valid_session
      }.to change(Andamento, :count).by(-1)
    end

    it "redirects to the andamentos list" do
      andamento = Andamento.create! valid_attributes
      delete :destroy, {:id => andamento.to_param}, valid_session
      response.should redirect_to(andamentos_url)
    end
  end

end