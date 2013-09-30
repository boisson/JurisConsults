class EscritoriosController < ApplicationController
  
  # GET /escritorios
  # GET /escritorios.json
  def index
    @search = Escritorio.search(params[:q])
    respond_to_grid(EscritoriosDatatable)
  end
  
  # GET /escritorios/1
  # GET /escritorios/1.json
  def show
    @escritorio = Escritorio.find(params[:id])

    respond_to do |format|
      format.json { render json: @escritorio }
      format.js
    end
  end

  # GET /escritorios/new
  # GET /escritorios/new.json
  def new
    @escritorio = Escritorio.new

    respond_to do |format|
      format.html { render layout: nil } # new.html.erb
      format.json { render json: @escritorio }
    end
  end

  # GET /escritorios/1/edit
  def edit
    @escritorio = Escritorio.find(params[:id])
    respond_to do |format|
      format.html { render layout: nil } # edit.html.erb
      format.js
    end
  end

  # POST /escritorios
  # POST /escritorios.json
  def create
    @escritorio = Escritorio.new(params[:escritorio])

    respond_to do |format|
      if @escritorio.save
        if params[:submit_and_go_to_new]
          flash.now[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.escritorio'))
        else
          flash[:notice] = t('general.messages.create_success', model_name: t('activerecord.models.escritorio'))
        end
        format.html { redirect_to edit_escritorio_path(@escritorio) }
        format.json { render json: @escritorio, status: :created, location: @escritorio }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.create_error', model_name: t('activerecord.models.escritorio'))
        format.html { render action: "new" }
        format.json { render json: @escritorio.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # PUT /escritorios/1
  # PUT /escritorios/1.json
  def update
    @escritorio = Escritorio.find(params[:id])

    respond_to do |format|
      if @escritorio.update_attributes(params[:escritorio])
        flash[:notice] = t('general.messages.update_success', model_name: t('activerecord.models.escritorio'))
        format.html { redirect_to edit_escritorio_path(@escritorio) }
        format.json { head :no_content }
        format.js { render action: 'save.js.erb' }
      else
        flash.now[:error] = t('general.messages.update_error', model_name: t('activerecord.models.escritorio'))
        format.html { render action: "edit" }
        format.json { render json: @escritorio.errors, status: :unprocessable_entity }
        format.js { render action: 'save.js.erb' }
      end
    end
  end

  # DELETE /escritorios/1
  # DELETE /escritorios/1.json
  def destroy
    @escritorio = Escritorio.find(params[:id])
    if @escritorio.destroy
      flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.escritorio'))
    else
      flash[:error] = t('general.messages.delete_error')
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render template: 'shared/batch_destroy.js.erb'}
    end
  end

  # DELETE /escritorios/batch_destroy?ids[]=1&ids[]=2
  # DELETE /escritorios/batch_destroy.json?ids[]=1&ids[]=2
  def batch_destroy 
    if params[:ids]
      if Escritorio.destroy_all(id: params[:ids])
        flash[:notice] = t('general.messages.delete_success', model_name: t('activerecord.models.escritorio'))
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
