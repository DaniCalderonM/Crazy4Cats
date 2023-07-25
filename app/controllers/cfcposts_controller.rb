class CfcpostsController < ApplicationController
  before_action :set_cfcpost, only: %i[ show edit update destroy ]
  before_action :authenticate_cfcuser!, except: %i[ index show ]
  before_action :redirect_si_user_no_coincide_con_creador_del_post , only: %i[ edit update destroy ]

  # GET /cfcposts or /cfcposts.json
  def index
    @cfcposts = Cfcpost.all
  end

  # GET /cfcposts/1 or /cfcposts/1.json
  def show
    @cfccomment = Cfccomment.new
    @cfccomment = @cfcpost.cfccomments
  end

  # GET /cfcposts/new
  def new
    @cfcpost = Cfcpost.new
  end

  # GET /cfcposts/1/edit
  def edit
  end

  # POST /cfcposts or /cfcposts.json
  def create
    @cfcpost = Cfcpost.new(cfcpost_params)
    @cfcpost.cfcuser = current_cfcuser
    respond_to do |format|
      if @cfcpost.save
        format.html { redirect_to cfcpost_url(@cfcpost), notice: "Cfcpost was successfully created." }
        format.json { render :show, status: :created, location: @cfcpost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cfcpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cfcposts/1 or /cfcposts/1.json
  def update
    respond_to do |format|
      if @cfcpost.update(cfcpost_params)
        format.html { redirect_to cfcpost_url(@cfcpost), notice: "Cfcpost was successfully updated." }
        format.json { render :show, status: :ok, location: @cfcpost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cfcpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cfcposts/1 or /cfcposts/1.json
  def destroy
    @cfcpost.destroy

    respond_to do |format|
      format.html { redirect_to cfcposts_url, notice: "Cfcpost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cfcpost
      @cfcpost = Cfcpost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cfcpost_params
      params.require(:cfcpost).permit(:image, :description, :cfcuser_id)
    end

    def redirect_si_user_no_coincide_con_creador_del_post
      if current_cfcuser.id != @cfcpost.cfcuser_id
          redirect_to root_path, notice: "No puedes realizar esta acción"
      end
    end

end
