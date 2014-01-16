class ContratosProcessosController < ApplicationController
  
  # GET /contratos_processos
  # GET /contratos_processos.json
  def index
    @search = ContratosProcesso.search(params[:q])
    respond_to_grid(ContratosProcessosDatatable)
  end
  
  # GET /contratos_processos/1
  # GET /contratos_processos/1.json
  def show
    @contratos_processo = ContratosProcesso.find(params[:id])

    respond_to do |format|
      format.json { render json: @contratos_processo }
      format.js
    end
  end

  # GET /contratos_processos/new
  # GET /contratos_processos/new.json
  def new
    @contratos_processo = ContratosProcesso.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @contratos_processo }
    end
  end

  # GET /contratos_processos/1/edit
  def edit
    @contratos_processo = ContratosProcesso.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /contratos_processos
  # POST /contratos_processos.json
  def create
    @contratos_processo = ContratosProcesso.new(params[:contratos_processo])

    respond_to do |format|
      if @contratos_processo.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.contratos_processo'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.contratos_processo'))
        end
        format.html { redirect_to edit_contratos_processo_path(@contratos_processo) }
        format.json { render json: @contratos_processo, status: :created, location: @contratos_processo }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.contratos_processo'))
        format.html { render action: "new" }
        format.json { render json: @contratos_processo.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /contratos_processos/1
  # PUT /contratos_processos/1.json
  def update
    @contratos_processo = ContratosProcesso.find(params[:id])

    respond_to do |format|
      if @contratos_processo.update_attributes(params[:contratos_processo])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.contratos_processo'))
        format.html { redirect_to edit_contratos_processo_path(@contratos_processo) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.contratos_processo'))
        format.html { render action: "edit" }
        format.json { render json: @contratos_processo.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /contratos_processos/1
  # DELETE /contratos_processos/1.json
  def destroy
    @contratos_processo = ContratosProcesso.find(params[:id])
    if @contratos_processo.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.contratos_processo'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /contratos_processos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /contratos_processos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if ContratosProcesso.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.contratos_processo'))
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
