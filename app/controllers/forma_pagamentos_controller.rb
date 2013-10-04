class FormaPagamentosController < ApplicationController
  
  # GET /forma_pagamentos
  # GET /forma_pagamentos.json
  def index
    @search = FormaPagamento.search(params[:q])
    respond_to_grid(FormaPagamentosDatatable)
  end
  
  # GET /forma_pagamentos/1
  # GET /forma_pagamentos/1.json
  def show
    @forma_pagamento = FormaPagamento.find(params[:id])

    respond_to do |format|
      format.json { render json: @forma_pagamento }
      format.js
    end
  end

  # GET /forma_pagamentos/new
  # GET /forma_pagamentos/new.json
  def new
    @forma_pagamento = FormaPagamento.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @forma_pagamento }
    end
  end

  # GET /forma_pagamentos/1/edit
  def edit
    @forma_pagamento = FormaPagamento.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /forma_pagamentos
  # POST /forma_pagamentos.json
  def create
    @forma_pagamento = FormaPagamento.new(params[:forma_pagamento])

    respond_to do |format|
      if @forma_pagamento.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.forma_pagamento'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.forma_pagamento'))
        end
        format.html { redirect_to edit_forma_pagamento_path(@forma_pagamento) }
        format.json { render json: @forma_pagamento, status: :created, location: @forma_pagamento }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.forma_pagamento'))
        format.html { render action: "new" }
        format.json { render json: @forma_pagamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /forma_pagamentos/1
  # PUT /forma_pagamentos/1.json
  def update
    @forma_pagamento = FormaPagamento.find(params[:id])

    respond_to do |format|
      if @forma_pagamento.update_attributes(params[:forma_pagamento])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.forma_pagamento'))
        format.html { redirect_to edit_forma_pagamento_path(@forma_pagamento) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.forma_pagamento'))
        format.html { render action: "edit" }
        format.json { render json: @forma_pagamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /forma_pagamentos/1
  # DELETE /forma_pagamentos/1.json
  def destroy
    @forma_pagamento = FormaPagamento.find(params[:id])
    if @forma_pagamento.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.forma_pagamento'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /forma_pagamentos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /forma_pagamentos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if FormaPagamento.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.forma_pagamento'))
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
