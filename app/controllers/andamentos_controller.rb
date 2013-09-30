class AndamentosController < ApplicationController
  
  # GET /andamentos
  # GET /andamentos.json
  def index
    @search = Andamento.search(params[:q])
    respond_to_grid(AndamentosDatatable)
  end
  
  # GET /andamentos/1
  # GET /andamentos/1.json
  def show
    @andamento = Andamento.find(params[:id])

    respond_to do |format|
      format.json { render json: @andamento }
      format.js
    end
  end

  # GET /andamentos/new
  # GET /andamentos/new.json
  def new
    @andamento = Andamento.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @andamento }
    end
  end

  # GET /andamentos/1/edit
  def edit
    @andamento = Andamento.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /andamentos
  # POST /andamentos.json
  def create
    @andamento = Andamento.new(params[:andamento])

    respond_to do |format|
      if @andamento.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.andamento'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.andamento'))
        end
        format.html { redirect_to edit_andamento_path(@andamento) }
        format.json { render json: @andamento, status: :created, location: @andamento }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.andamento'))
        format.html { render action: "new" }
        format.json { render json: @andamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /andamentos/1
  # PUT /andamentos/1.json
  def update
    @andamento = Andamento.find(params[:id])

    respond_to do |format|
      if @andamento.update_attributes(params[:andamento])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.andamento'))
        format.html { redirect_to edit_andamento_path(@andamento) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.andamento'))
        format.html { render action: "edit" }
        format.json { render json: @andamento.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /andamentos/1
  # DELETE /andamentos/1.json
  def destroy
    @andamento = Andamento.find(params[:id])
    if @andamento.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.andamento'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /andamentos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /andamentos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Andamento.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.andamento'))
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
