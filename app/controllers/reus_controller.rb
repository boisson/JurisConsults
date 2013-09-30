class ReusController < ApplicationController
  
  # GET /reus
  # GET /reus.json
  def index
    @search = Reu.search(params[:q])
    respond_to_grid(ReusDatatable)
  end
  
  # GET /reus/1
  # GET /reus/1.json
  def show
    @reu = Reu.find(params[:id])

    respond_to do |format|
      format.json { render json: @reu }
      format.js
    end
  end

  # GET /reus/new
  # GET /reus/new.json
  def new
    @reu = Reu.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @reu }
    end
  end

  # GET /reus/1/edit
  def edit
    @reu = Reu.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /reus
  # POST /reus.json
  def create
    @reu = Reu.new(params[:reu])

    respond_to do |format|
      if @reu.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.reu'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.reu'))
        end
        format.html { redirect_to edit_reu_path(@reu) }
        format.json { render json: @reu, status: :created, location: @reu }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.reu'))
        format.html { render action: "new" }
        format.json { render json: @reu.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /reus/1
  # PUT /reus/1.json
  def update
    @reu = Reu.find(params[:id])

    respond_to do |format|
      if @reu.update_attributes(params[:reu])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.reu'))
        format.html { redirect_to edit_reu_path(@reu) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.reu'))
        format.html { render action: "edit" }
        format.json { render json: @reu.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /reus/1
  # DELETE /reus/1.json
  def destroy
    @reu = Reu.find(params[:id])
    if @reu.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.reu'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /reus/batch_destroy?ids[]=1&ids[]=2
  # DELETE /reus/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Reu.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.reu'))
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
