class TypesController < ApplicationController
  # GET /types
  # GET /types.json
  def index
    @sport = Sport.find(params[:sport_id])
    @types = @sport.types.sort_by &:stack_order

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end

  # GET /types/1
  # GET /types/1.json
  def show
    @sport = Sport.find(params[:sport_id])
    @type = Type.find(params[:id])
    @events = @type.events
    
    # @type = Type.find(params[:id])
 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@type] }
    end
  end

  # GET /types/new
  # GET /types/new.json
  def new
    @sport = Sport.find(params[:sport_id])
    @type = Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type }
    end
  end

  # GET /types/1/edit
  def edit
    @sport = Sport.find(params[:sport_id])
    @type = Type.find(params[:id])
  end

  # POST /types
  # POST /types.json
  def create
    @sport = Sport.find(params[:sport_id])
    @type = @sport.types.build(params[:type_id])

    respond_to do |format|
      if @type.update_attributes(params[:type])

         format.html { redirect_to [@sport, @type], notice: 'Type was successfully created.' }
         format.json { render json: [@type], status: :created, location: [@type] }
      else
        format.html { render action: "new" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /types/1
  # PUT /types/1.json
  def update
    @sport = Sport.find(params[:sport_id])
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to [@sport, @type], notice: 'Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @sport = Sport.find(params[:sport_id])
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to sport_types_url }
      format.json { head :no_content }
    end
  end
end
