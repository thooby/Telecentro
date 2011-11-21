class VentaController < ApplicationController
  # GET /venta
  # GET /venta.json
  def index
    @venta = Ventum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @venta }
    end
  end

  # GET /venta/1
  # GET /venta/1.json
  def show
    @ventum = Ventum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ventum }
    end
  end

  # GET /venta/new
  # GET /venta/new.json
  def new
    @ventum = Ventum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ventum }
    end
  end

  # GET /venta/1/edit
  def edit
    @ventum = Ventum.find(params[:id])
  end

  # POST /venta
  # POST /venta.json
  def create
    @ventum = Ventum.new(params[:ventum])

    respond_to do |format|
      if @ventum.save
        format.html { redirect_to @ventum, :notice => 'Ventum was successfully created.' }
        format.json { render :json => @ventum, :status => :created, :location => @ventum }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ventum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venta/1
  # PUT /venta/1.json
  def update
    @ventum = Ventum.find(params[:id])

    respond_to do |format|
      if @ventum.update_attributes(params[:ventum])
        format.html { redirect_to @ventum, :notice => 'Ventum was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ventum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venta/1
  # DELETE /venta/1.json
  def destroy
    @ventum = Ventum.find(params[:id])
    @ventum.destroy

    respond_to do |format|
      format.html { redirect_to venta_url }
      format.json { head :ok }
    end
  end
end
