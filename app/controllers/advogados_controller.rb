class AdvogadosController < ApplicationController
  
  # GET /advogados
  # GET /advogados.json
  def index
    @search = Advogado.search(params[:q])
    respond_to_grid(AdvogadosDatatable)
  end
  
  # GET /advogados/1
  # GET /advogados/1.json
  def show
    @advogado = Advogado.find(params[:id])

    respond_to do |format|
      format.json { render json: @advogado }
      format.js
    end
  end

  # GET /advogados/new
  # GET /advogados/new.json
  def new
    @advogado = Advogado.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @advogado }
    end
  end

  # GET /advogados/1/edit
  def edit
    @advogado = Advogado.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /advogados
  # POST /advogados.json
  def create
    @advogado = Advogado.new(params[:advogado])

    respond_to do |format|
      if @advogado.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.advogado'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.advogado'))
        end
        format.html { redirect_to edit_advogado_path(@advogado) }
        format.json { render json: @advogado, status: :created, location: @advogado }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.advogado'))
        format.html { render action: "new" }
        format.json { render json: @advogado.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /advogados/1
  # PUT /advogados/1.json
  def update
    @advogado = Advogado.find(params[:id])

    respond_to do |format|
      if @advogado.update_attributes(params[:advogado])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.advogado'))
        format.html { redirect_to edit_advogado_path(@advogado) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.advogado'))
        format.html { render action: "edit" }
        format.json { render json: @advogado.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /advogados/1
  # DELETE /advogados/1.json
  def destroy
    @advogado = Advogado.find(params[:id])
    if @advogado.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.advogado'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /advogados/batch_destroy?ids[]=1&ids[]=2
  # DELETE /advogados/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Advogado.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.advogado'))
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
