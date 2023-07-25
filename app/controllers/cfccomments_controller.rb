class CfccommentsController < ApplicationController
    before_action :set_cfccomment, only: %i[ show destroy ] 
    before_action :redirect_si_user_no_coincide_con_creador_del_comment , only: %i[ edit update destroy ]
  
    # GET /comments/1 or /comments/1.json
    def show
    end
  
    # GET /cfccomments/new
    def new
      @cfccomment = Cfccomment.new
    end
  
    # GET /cfccomments/1/edit
    def edit
    end
  
    # POST /cfccomments or /cfccomments.json
    def create
      @cfccomment = Cfccomment.new(cfccomment_params)
      if cfcuser_signed_in?
      @cfccomment.cfcuser = current_cfcuser
      end
      respond_to do |format|
        if @cfccomment.save
          format.html { redirect_to cfccomments_url(@cfccomment), notice: "Tú comentario fue creado con éxito." }
        else
          format.html { redirect_to cfccomments_url(@cfccomment), notice: "No se pudo crear tú comentario" }
        end
      end
    end
  
    # DELETE /comments/1 or /comments/1.json
    def destroy
      @cfccomment.destroy
      respond_to do |format|
        format.html { redirect_to cfccomments_url(@cfccomment), notice: "Tú comentario fue eliminado con éxito" }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cfccomment
        @cfccomment = Cfccomment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def cfccomment_params
        params.require(:cfccomment).permit(:content, :cfcuser_id, :cfcpost_id )
      end
  
      def redirect_si_user_no_coincide_con_creador_del_comment
          if current_cfcuser.id!= @cfccomment.cfcuser_id
            redirect_to root_path, notice: "No puedes realizar esta acción"
        end
      end
end
