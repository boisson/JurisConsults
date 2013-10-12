class AcompanhamentosController < ApplicationController
  
  # GET /acompanhamentos
  # GET /acompanhamentos.json
  def index
    @search = Acompanhamento.search(params[:q])
    respond_to_grid(AcompanhamentosDatatable)
  end
  
  # GET /acompanhamentos/1
  # GET /acompanhamentos/1.json
  def show
    @acompanhamento = Acompanhamento.find(params[:id])

    respond_to do |format|
      format.json { render json: @acompanhamento }
      format.js
    end
  end

  # GET /acompanhamentos/new
  # GET /acompanhamentos/new.json
  def new
    @acompanhamento = Acompanhamento.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @acompanhamento }
    end
  end

  # GET /acompanhamentos/1/edit
  def edit
    @acompanhamento = Acompanhamento.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /acompanhamentos
  # POST /acompanhamentos.json
  def create
    @acompanhamento = Acompanhamento.new(params[:acompanhamento])

    respond_to do |format|
      if @acompanhamento.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.acompanhamento'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.acompanhamento'))
        end
        format.html { redirect_to edit_acompanhamento_path(@acompanhamento) }
        format.json { render json: @acompanhamento, status: :created, location: @acompanhamento }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.acompanhamento'))
        format.html { render action: "new" }
        format.json { render json: @acompanhamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /acompanhamentos/1
  # PUT /acompanhamentos/1.json
  def update
    @acompanhamento = Acompanhamento.find(params[:id])

    respond_to do |format|
      if @acompanhamento.update_attributes(params[:acompanhamento])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.acompanhamento'))
        format.html { redirect_to edit_acompanhamento_path(@acompanhamento) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.acompanhamento'))
        format.html { render action: "edit" }
        format.json { render json: @acompanhamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /acompanhamentos/1
  # DELETE /acompanhamentos/1.json
  def destroy
    @acompanhamento = Acompanhamento.find(params[:id])
    if @acompanhamento.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.acompanhamento'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /acompanhamentos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /acompanhamentos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Acompanhamento.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.acompanhamento'))
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
