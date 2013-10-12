class CentroCustosController < ApplicationController
  
  # GET /centro_custos
  # GET /centro_custos.json
  def index
    @search = CentroCusto.search(params[:q])
    respond_to_grid(CentroCustosDatatable)
  end
  
  # GET /centro_custos/1
  # GET /centro_custos/1.json
  def show
    @centro_custo = CentroCusto.find(params[:id])

    respond_to do |format|
      format.json { render json: @centro_custo }
      format.js
    end
  end

  # GET /centro_custos/new
  # GET /centro_custos/new.json
  def new
    @centro_custo = CentroCusto.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @centro_custo }
    end
  end

  # GET /centro_custos/1/edit
  def edit
    @centro_custo = CentroCusto.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /centro_custos
  # POST /centro_custos.json
  def create
    @centro_custo = CentroCusto.new(params[:centro_custo])

    respond_to do |format|
      if @centro_custo.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.centro_custo'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.centro_custo'))
        end
        format.html { redirect_to edit_centro_custo_path(@centro_custo) }
        format.json { render json: @centro_custo, status: :created, location: @centro_custo }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.centro_custo'))
        format.html { render action: "new" }
        format.json { render json: @centro_custo.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /centro_custos/1
  # PUT /centro_custos/1.json
  def update
    @centro_custo = CentroCusto.find(params[:id])

    respond_to do |format|
      if @centro_custo.update_attributes(params[:centro_custo])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.centro_custo'))
        format.html { redirect_to edit_centro_custo_path(@centro_custo) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.centro_custo'))
        format.html { render action: "edit" }
        format.json { render json: @centro_custo.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /centro_custos/1
  # DELETE /centro_custos/1.json
  def destroy
    @centro_custo = CentroCusto.find(params[:id])
    if @centro_custo.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.centro_custo'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /centro_custos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /centro_custos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if CentroCusto.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.centro_custo'))
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
