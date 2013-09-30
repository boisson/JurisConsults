class LocalsController < ApplicationController
  
  # GET /locals
  # GET /locals.json
  def index
    @search = Local.search(params[:q])
    respond_to_grid(LocalsDatatable)
  end
  
  # GET /locals/1
  # GET /locals/1.json
  def show
    @local = Local.find(params[:id])

    respond_to do |format|
      format.json { render json: @local }
      format.js
    end
  end

  # GET /locals/new
  # GET /locals/new.json
  def new
    @local = Local.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @local }
    end
  end

  # GET /locals/1/edit
  def edit
    @local = Local.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /locals
  # POST /locals.json
  def create
    @local = Local.new(params[:local])

    respond_to do |format|
      if @local.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.local'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.local'))
        end
        format.html { redirect_to edit_local_path(@local) }
        format.json { render json: @local, status: :created, location: @local }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.local'))
        format.html { render action: "new" }
        format.json { render json: @local.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /locals/1
  # PUT /locals/1.json
  def update
    @local = Local.find(params[:id])

    respond_to do |format|
      if @local.update_attributes(params[:local])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.local'))
        format.html { redirect_to edit_local_path(@local) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.local'))
        format.html { render action: "edit" }
        format.json { render json: @local.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /locals/1
  # DELETE /locals/1.json
  def destroy
    @local = Local.find(params[:id])
    if @local.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.local'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /locals/batch_destroy?ids[]=1&ids[]=2
  # DELETE /locals/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Local.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.local'))
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
