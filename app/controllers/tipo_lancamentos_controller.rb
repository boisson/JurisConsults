class TipoLancamentosController < ApplicationController
  
  # GET /tipo_lancamentos
  # GET /tipo_lancamentos.json
  def index
    @search = TipoLancamento.search(params[:q])
    respond_to_grid(TipoLancamentosDatatable)
  end
  
  # GET /tipo_lancamentos/1
  # GET /tipo_lancamentos/1.json
  def show
    @tipo_lancamento = TipoLancamento.find(params[:id])

    respond_to do |format|
      format.json { render json: @tipo_lancamento }
      format.js
    end
  end

  # GET /tipo_lancamentos/new
  # GET /tipo_lancamentos/new.json
  def new
    @tipo_lancamento = TipoLancamento.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @tipo_lancamento }
    end
  end

  # GET /tipo_lancamentos/1/edit
  def edit
    @tipo_lancamento = TipoLancamento.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /tipo_lancamentos
  # POST /tipo_lancamentos.json
  def create
    @tipo_lancamento = TipoLancamento.new(params[:tipo_lancamento])

    respond_to do |format|
      if @tipo_lancamento.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.tipo_lancamento'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.tipo_lancamento'))
        end
        format.html { redirect_to edit_tipo_lancamento_path(@tipo_lancamento) }
        format.json { render json: @tipo_lancamento, status: :created, location: @tipo_lancamento }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.tipo_lancamento'))
        format.html { render action: "new" }
        format.json { render json: @tipo_lancamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /tipo_lancamentos/1
  # PUT /tipo_lancamentos/1.json
  def update
    @tipo_lancamento = TipoLancamento.find(params[:id])

    respond_to do |format|
      if @tipo_lancamento.update_attributes(params[:tipo_lancamento])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.tipo_lancamento'))
        format.html { redirect_to edit_tipo_lancamento_path(@tipo_lancamento) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.tipo_lancamento'))
        format.html { render action: "edit" }
        format.json { render json: @tipo_lancamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /tipo_lancamentos/1
  # DELETE /tipo_lancamentos/1.json
  def destroy
    @tipo_lancamento = TipoLancamento.find(params[:id])
    if @tipo_lancamento.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.tipo_lancamento'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /tipo_lancamentos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /tipo_lancamentos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if TipoLancamento.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.tipo_lancamento'))
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
