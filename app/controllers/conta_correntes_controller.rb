class ContaCorrentesController < ApplicationController
  
  # GET /conta_correntes
  # GET /conta_correntes.json
  def index
    @search = ContaCorrente.search(params[:q])
    respond_to_grid(ContaCorrentesDatatable)
  end
  
  # GET /conta_correntes/1
  # GET /conta_correntes/1.json
  def show
    @conta_corrente = ContaCorrente.find(params[:id])

    respond_to do |format|
      format.json { render json: @conta_corrente }
      format.js
    end
  end

  # GET /conta_correntes/new
  # GET /conta_correntes/new.json
  def new
    @conta_corrente = ContaCorrente.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @conta_corrente }
    end
  end

  # GET /conta_correntes/1/edit
  def edit
    @conta_corrente = ContaCorrente.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /conta_correntes
  # POST /conta_correntes.json
  def create
    @conta_corrente = ContaCorrente.new(params[:conta_corrente])

    respond_to do |format|
      if @conta_corrente.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.conta_corrente'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.conta_corrente'))
        end
        format.html { redirect_to edit_conta_corrente_path(@conta_corrente) }
        format.json { render json: @conta_corrente, status: :created, location: @conta_corrente }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.conta_corrente'))
        format.html { render action: "new" }
        format.json { render json: @conta_corrente.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /conta_correntes/1
  # PUT /conta_correntes/1.json
  def update
    @conta_corrente = ContaCorrente.find(params[:id])

    respond_to do |format|
      if @conta_corrente.update_attributes(params[:conta_corrente])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.conta_corrente'))
        format.html { redirect_to edit_conta_corrente_path(@conta_corrente) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.conta_corrente'))
        format.html { render action: "edit" }
        format.json { render json: @conta_corrente.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /conta_correntes/1
  # DELETE /conta_correntes/1.json
  def destroy
    @conta_corrente = ContaCorrente.find(params[:id])
    if @conta_corrente.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.conta_corrente'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /conta_correntes/batch_destroy?ids[]=1&ids[]=2
  # DELETE /conta_correntes/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if ContaCorrente.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.conta_corrente'))
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
