class TipoProcessosController < ApplicationController
  
  # GET /tipo_processos
  # GET /tipo_processos.json
  def index
    @search = TipoProcesso.search(params[:q])
    respond_to_grid(TipoProcessosDatatable)
  end
  
  # GET /tipo_processos/1
  # GET /tipo_processos/1.json
  def show
    @tipo_processo = TipoProcesso.find(params[:id])

    respond_to do |format|
      format.json { render json: @tipo_processo }
      format.js
    end
  end

  # GET /tipo_processos/new
  # GET /tipo_processos/new.json
  def new
    @tipo_processo = TipoProcesso.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @tipo_processo }
    end
  end

  # GET /tipo_processos/1/edit
  def edit
    @tipo_processo = TipoProcesso.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /tipo_processos
  # POST /tipo_processos.json
  def create
    @tipo_processo = TipoProcesso.new(params[:tipo_processo])

    respond_to do |format|
      if @tipo_processo.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.tipo_processo'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.tipo_processo'))
        end
        format.html { redirect_to edit_tipo_processo_path(@tipo_processo) }
        format.json { render json: @tipo_processo, status: :created, location: @tipo_processo }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.tipo_processo'))
        format.html { render action: "new" }
        format.json { render json: @tipo_processo.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /tipo_processos/1
  # PUT /tipo_processos/1.json
  def update
    @tipo_processo = TipoProcesso.find(params[:id])

    respond_to do |format|
      if @tipo_processo.update_attributes(params[:tipo_processo])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.tipo_processo'))
        format.html { redirect_to edit_tipo_processo_path(@tipo_processo) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.tipo_processo'))
        format.html { render action: "edit" }
        format.json { render json: @tipo_processo.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /tipo_processos/1
  # DELETE /tipo_processos/1.json
  def destroy
    @tipo_processo = TipoProcesso.find(params[:id])
    if @tipo_processo.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.tipo_processo'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /tipo_processos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /tipo_processos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if TipoProcesso.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.tipo_processo'))
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
