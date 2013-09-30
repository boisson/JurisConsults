class TipoAndamentosController < ApplicationController
  
  # GET /tipo_andamentos
  # GET /tipo_andamentos.json
  def index
    @search = TipoAndamento.search(params[:q])
    respond_to_grid(TipoAndamentosDatatable)
  end
  
  # GET /tipo_andamentos/1
  # GET /tipo_andamentos/1.json
  def show
    @tipo_andamento = TipoAndamento.find(params[:id])

    respond_to do |format|
      format.json { render json: @tipo_andamento }
      format.js
    end
  end

  # GET /tipo_andamentos/new
  # GET /tipo_andamentos/new.json
  def new
    @tipo_andamento = TipoAndamento.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @tipo_andamento }
    end
  end

  # GET /tipo_andamentos/1/edit
  def edit
    @tipo_andamento = TipoAndamento.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /tipo_andamentos
  # POST /tipo_andamentos.json
  def create
    @tipo_andamento = TipoAndamento.new(params[:tipo_andamento])

    respond_to do |format|
      if @tipo_andamento.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.tipo_andamento'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.tipo_andamento'))
        end
        format.html { redirect_to edit_tipo_andamento_path(@tipo_andamento) }
        format.json { render json: @tipo_andamento, status: :created, location: @tipo_andamento }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.tipo_andamento'))
        format.html { render action: "new" }
        format.json { render json: @tipo_andamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /tipo_andamentos/1
  # PUT /tipo_andamentos/1.json
  def update
    @tipo_andamento = TipoAndamento.find(params[:id])

    respond_to do |format|
      if @tipo_andamento.update_attributes(params[:tipo_andamento])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.tipo_andamento'))
        format.html { redirect_to edit_tipo_andamento_path(@tipo_andamento) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.tipo_andamento'))
        format.html { render action: "edit" }
        format.json { render json: @tipo_andamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /tipo_andamentos/1
  # DELETE /tipo_andamentos/1.json
  def destroy
    @tipo_andamento = TipoAndamento.find(params[:id])
    if @tipo_andamento.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.tipo_andamento'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /tipo_andamentos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /tipo_andamentos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if TipoAndamento.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.tipo_andamento'))
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
