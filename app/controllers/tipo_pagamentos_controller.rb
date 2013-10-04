class TipoPagamentosController < ApplicationController
  
  # GET /tipo_pagamentos
  # GET /tipo_pagamentos.json
  def index
    @search = TipoPagamento.search(params[:q])
    respond_to_grid(TipoPagamentosDatatable)
  end
  
  # GET /tipo_pagamentos/1
  # GET /tipo_pagamentos/1.json
  def show
    @tipo_pagamento = TipoPagamento.find(params[:id])

    respond_to do |format|
      format.json { render json: @tipo_pagamento }
      format.js
    end
  end

  # GET /tipo_pagamentos/new
  # GET /tipo_pagamentos/new.json
  def new
    @tipo_pagamento = TipoPagamento.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @tipo_pagamento }
    end
  end

  # GET /tipo_pagamentos/1/edit
  def edit
    @tipo_pagamento = TipoPagamento.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /tipo_pagamentos
  # POST /tipo_pagamentos.json
  def create
    @tipo_pagamento = TipoPagamento.new(params[:tipo_pagamento])

    respond_to do |format|
      if @tipo_pagamento.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.tipo_pagamento'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.tipo_pagamento'))
        end
        format.html { redirect_to edit_tipo_pagamento_path(@tipo_pagamento) }
        format.json { render json: @tipo_pagamento, status: :created, location: @tipo_pagamento }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.tipo_pagamento'))
        format.html { render action: "new" }
        format.json { render json: @tipo_pagamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /tipo_pagamentos/1
  # PUT /tipo_pagamentos/1.json
  def update
    @tipo_pagamento = TipoPagamento.find(params[:id])

    respond_to do |format|
      if @tipo_pagamento.update_attributes(params[:tipo_pagamento])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.tipo_pagamento'))
        format.html { redirect_to edit_tipo_pagamento_path(@tipo_pagamento) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.tipo_pagamento'))
        format.html { render action: "edit" }
        format.json { render json: @tipo_pagamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /tipo_pagamentos/1
  # DELETE /tipo_pagamentos/1.json
  def destroy
    @tipo_pagamento = TipoPagamento.find(params[:id])
    if @tipo_pagamento.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.tipo_pagamento'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /tipo_pagamentos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /tipo_pagamentos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if TipoPagamento.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.tipo_pagamento'))
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
