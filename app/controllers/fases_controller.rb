class FasesController < ApplicationController
  
  # GET /fases
  # GET /fases.json
  def index
    @search = Fase.search(params[:q])
    respond_to_grid(FasesDatatable)
  end
  
  # GET /fases/1
  # GET /fases/1.json
  def show
    @fase = Fase.find(params[:id])

    respond_to do |format|
      format.json { render json: @fase }
      format.js
    end
  end

  # GET /fases/new
  # GET /fases/new.json
  def new
    @fase = Fase.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @fase }
    end
  end

  # GET /fases/1/edit
  def edit
    @fase = Fase.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /fases
  # POST /fases.json
  def create
    @fase = Fase.new(params[:fase])

    respond_to do |format|
      if @fase.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.fase'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.fase'))
        end
        format.html { redirect_to edit_fase_path(@fase) }
        format.json { render json: @fase, status: :created, location: @fase }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.fase'))
        format.html { render action: "new" }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /fases/1
  # PUT /fases/1.json
  def update
    @fase = Fase.find(params[:id])

    respond_to do |format|
      if @fase.update_attributes(params[:fase])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.fase'))
        format.html { redirect_to edit_fase_path(@fase) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.fase'))
        format.html { render action: "edit" }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /fases/1
  # DELETE /fases/1.json
  def destroy
    @fase = Fase.find(params[:id])
    if @fase.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.fase'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /fases/batch_destroy?ids[]=1&ids[]=2
  # DELETE /fases/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Fase.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.fase'))
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
