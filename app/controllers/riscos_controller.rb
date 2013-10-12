class RiscosController < ApplicationController
  
  # GET /riscos
  # GET /riscos.json
  def index
    @search = Risco.search(params[:q])
    respond_to_grid(RiscosDatatable)
  end
  
  # GET /riscos/1
  # GET /riscos/1.json
  def show
    @risco = Risco.find(params[:id])

    respond_to do |format|
      format.json { render json: @risco }
      format.js
    end
  end

  # GET /riscos/new
  # GET /riscos/new.json
  def new
    @risco = Risco.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @risco }
    end
  end

  # GET /riscos/1/edit
  def edit
    @risco = Risco.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /riscos
  # POST /riscos.json
  def create
    @risco = Risco.new(params[:risco])

    respond_to do |format|
      if @risco.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.risco'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.risco'))
        end
        format.html { redirect_to edit_risco_path(@risco) }
        format.json { render json: @risco, status: :created, location: @risco }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.risco'))
        format.html { render action: "new" }
        format.json { render json: @risco.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /riscos/1
  # PUT /riscos/1.json
  def update
    @risco = Risco.find(params[:id])

    respond_to do |format|
      if @risco.update_attributes(params[:risco])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.risco'))
        format.html { redirect_to edit_risco_path(@risco) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.risco'))
        format.html { render action: "edit" }
        format.json { render json: @risco.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /riscos/1
  # DELETE /riscos/1.json
  def destroy
    @risco = Risco.find(params[:id])
    if @risco.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.risco'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /riscos/batch_destroy?ids[]=1&ids[]=2
  # DELETE /riscos/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Risco.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.risco'))
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
