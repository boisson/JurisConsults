class AssuntoProcessualsController < ApplicationController
  
  # GET /assunto_processuals
  # GET /assunto_processuals.json
  def index
    @search = AssuntoProcessual.search(params[:q])
    respond_to_grid(AssuntoProcessualsDatatable)
  end
  
  # GET /assunto_processuals/1
  # GET /assunto_processuals/1.json
  def show
    @assunto_processual = AssuntoProcessual.find(params[:id])

    respond_to do |format|
      format.json { render json: @assunto_processual }
      format.js
    end
  end

  # GET /assunto_processuals/new
  # GET /assunto_processuals/new.json
  def new
    @assunto_processual = AssuntoProcessual.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @assunto_processual }
    end
  end

  # GET /assunto_processuals/1/edit
  def edit
    @assunto_processual = AssuntoProcessual.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /assunto_processuals
  # POST /assunto_processuals.json
  def create
    @assunto_processual = AssuntoProcessual.new(params[:assunto_processual])

    respond_to do |format|
      if @assunto_processual.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.assunto_processual'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.assunto_processual'))
        end
        format.html { redirect_to edit_assunto_processual_path(@assunto_processual) }
        format.json { render json: @assunto_processual, status: :created, location: @assunto_processual }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.assunto_processual'))
        format.html { render action: "new" }
        format.json { render json: @assunto_processual.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /assunto_processuals/1
  # PUT /assunto_processuals/1.json
  def update
    @assunto_processual = AssuntoProcessual.find(params[:id])

    respond_to do |format|
      if @assunto_processual.update_attributes(params[:assunto_processual])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.assunto_processual'))
        format.html { redirect_to edit_assunto_processual_path(@assunto_processual) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.assunto_processual'))
        format.html { render action: "edit" }
        format.json { render json: @assunto_processual.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /assunto_processuals/1
  # DELETE /assunto_processuals/1.json
  def destroy
    @assunto_processual = AssuntoProcessual.find(params[:id])
    if @assunto_processual.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.assunto_processual'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /assunto_processuals/batch_destroy?ids[]=1&ids[]=2
  # DELETE /assunto_processuals/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if AssuntoProcessual.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.assunto_processual'))
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
