class ProcessosController < ApplicationController
  
  # GET /processos
  # GET /processos.json
  def index
    @search = Processo.search(params[:q])
    respond_to_grid(ProcessosDatatable)
  end
  
  # GET /processos/1
  # GET /processos/1.json
  def show
    @processo = Processo.find(params[:id])

    respond_to do |format|
      format.json { render json: @processo }
      format.js
    end
  end

  # GET /processos/new
  # GET /processos/new.json
  def new
    @processo = Processo.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @processo }
    end
  end

  # GET /processos/1/edit
  def edit
    @processo = Processo.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /processos
  # POST /processos.json
  def create
    @processo = Processo.new(params[:processo])

    respond_to do |format|
      if @processo.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.processo'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.processo'))
        end
        format.html { redirect_to edit_processo_path(@processo) }
        format.json { render json: @processo, status: :created, location: @processo }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.processo'))
        format.html { render action: "new" }
        format.json { render json: @processo.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /processos/1
  # PUT /processos/1.json
  def update
    @processo = Processo.find(params[:id])

    respond_to do |format|
      if @processo.update_attributes(params[:processo])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.processo'))
        format.html { redirect_to edit_processo_path(@processo) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.processo'))
        format.html { render action: "edit" }
        format.json { render json: @processo.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /processos/1
  # DELETE /processos/1.json
  def destroy
    @processo = Processo.find(params[:id])
    if @processo.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.processo'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /processos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /processos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Processo.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.processo'))
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
