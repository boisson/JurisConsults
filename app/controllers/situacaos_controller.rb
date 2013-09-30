class SituacaosController < ApplicationController
  
  # GET /situacaos
  # GET /situacaos.json
  def index
    @search = Situacao.search(params[:q])
    respond_to_grid(SituacaosDatatable)
  end
  
  # GET /situacaos/1
  # GET /situacaos/1.json
  def show
    @situacao = Situacao.find(params[:id])

    respond_to do |format|
      format.json { render json: @situacao }
      format.js
    end
  end

  # GET /situacaos/new
  # GET /situacaos/new.json
  def new
    @situacao = Situacao.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @situacao }
    end
  end

  # GET /situacaos/1/edit
  def edit
    @situacao = Situacao.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /situacaos
  # POST /situacaos.json
  def create
    @situacao = Situacao.new(params[:situacao])

    respond_to do |format|
      if @situacao.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.situacao'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.situacao'))
        end
        format.html { redirect_to edit_situacao_path(@situacao) }
        format.json { render json: @situacao, status: :created, location: @situacao }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.situacao'))
        format.html { render action: "new" }
        format.json { render json: @situacao.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /situacaos/1
  # PUT /situacaos/1.json
  def update
    @situacao = Situacao.find(params[:id])

    respond_to do |format|
      if @situacao.update_attributes(params[:situacao])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.situacao'))
        format.html { redirect_to edit_situacao_path(@situacao) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.situacao'))
        format.html { render action: "edit" }
        format.json { render json: @situacao.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /situacaos/1
  # DELETE /situacaos/1.json
  def destroy
    @situacao = Situacao.find(params[:id])
    if @situacao.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.situacao'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /situacaos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /situacaos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Situacao.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.situacao'))
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
