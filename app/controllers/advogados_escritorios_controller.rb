class AdvogadosEscritoriosController < ApplicationController
  
  # GET /advogados_escritorios
  # GET /advogados_escritorios.json
  def index
    @search = AdvogadosEscritorio.search(params[:q])
    respond_to_grid(AdvogadosEscritoriosDatatable)
  end
  
  # GET /advogados_escritorios/1
  # GET /advogados_escritorios/1.json
  def show
    @advogados_escritorio = AdvogadosEscritorio.find(params[:id])

    respond_to do |format|
      format.json { render json: @advogados_escritorio }
      format.js
    end
  end

  # GET /advogados_escritorios/new
  # GET /advogados_escritorios/new.json
  def new
    @advogados_escritorio = AdvogadosEscritorio.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @advogados_escritorio }
    end
  end

  # GET /advogados_escritorios/1/edit
  def edit
    @advogados_escritorio = AdvogadosEscritorio.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /advogados_escritorios
  # POST /advogados_escritorios.json
  def create
    @advogados_escritorio = AdvogadosEscritorio.new(params[:advogados_escritorio])

    respond_to do |format|
      if @advogados_escritorio.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.advogados_escritorio'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.advogados_escritorio'))
        end
        format.html { redirect_to edit_advogados_escritorio_path(@advogados_escritorio) }
        format.json { render json: @advogados_escritorio, status: :created, location: @advogados_escritorio }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.advogados_escritorio'))
        format.html { render action: "new" }
        format.json { render json: @advogados_escritorio.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /advogados_escritorios/1
  # PUT /advogados_escritorios/1.json
  def update
    @advogados_escritorio = AdvogadosEscritorio.find(params[:id])

    respond_to do |format|
      if @advogados_escritorio.update_attributes(params[:advogados_escritorio])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.advogados_escritorio'))
        format.html { redirect_to edit_advogados_escritorio_path(@advogados_escritorio) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.advogados_escritorio'))
        format.html { render action: "edit" }
        format.json { render json: @advogados_escritorio.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /advogados_escritorios/1
  # DELETE /advogados_escritorios/1.json
  def destroy
    @advogados_escritorio = AdvogadosEscritorio.find(params[:id])
    if @advogados_escritorio.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.advogados_escritorio'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /advogados_escritorios/batch_destroy?ids[]=1&ids[]=2
  # DELETE /advogados_escritorios/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if AdvogadosEscritorio.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.advogados_escritorio'))
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
