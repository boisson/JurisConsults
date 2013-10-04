class ContratosController < ApplicationController
  
  # GET /contratos
  # GET /contratos.json
  def index
    @search = Contrato.search(params[:q])
    respond_to_grid(ContratosDatatable)
  end
  
  # GET /contratos/1
  # GET /contratos/1.json
  def show
    @contrato = Contrato.find(params[:id])

    respond_to do |format|
      format.json { render json: @contrato }
      format.js
    end
  end

  # GET /contratos/new
  # GET /contratos/new.json
  def new
    @contrato = Contrato.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @contrato }
    end
  end

  # GET /contratos/1/edit
  def edit
    @contrato = Contrato.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /contratos
  # POST /contratos.json
  def create
    @contrato = Contrato.new(params[:contrato])

    respond_to do |format|
      if @contrato.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.contrato'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.contrato'))
        end
        format.html { redirect_to edit_contrato_path(@contrato) }
        format.json { render json: @contrato, status: :created, location: @contrato }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.contrato'))
        format.html { render action: "new" }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /contratos/1
  # PUT /contratos/1.json
  def update
    @contrato = Contrato.find(params[:id])

    respond_to do |format|
      if @contrato.update_attributes(params[:contrato])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.contrato'))
        format.html { redirect_to edit_contrato_path(@contrato) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.contrato'))
        format.html { render action: "edit" }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /contratos/1
  # DELETE /contratos/1.json
  def destroy
    @contrato = Contrato.find(params[:id])
    if @contrato.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.contrato'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /contratos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /contratos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Contrato.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.contrato'))
      else
        flash[:error] = t('general.messages.delete_error')
      end
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb' }
    end
  end
end
