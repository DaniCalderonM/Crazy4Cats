class CfcreactionsController < ApplicationController
    before_action :authenticate_cfcuser!

    def new_cfcuser_cfcreaction
        @cfcuser = current_cfcuser
        @cfcpost = Cfcpost.find(params[:cfcpost_id]) 
        if params[:cfcpost_id]
        @kind = params[:kind]
        respond_to do |format|
            cfcreaction_cfcpost = Cfcreaction.find_by(cfcuser_id: @cfcuser.id, cfcpost_id: @cfcpost.id)
                if @cfcuser.any?
                    format.html { redirect_to cfcpost_url(@cfcpost), notice: 'Ya reaccionaste a esta publicación!' }
   
                #Creacion de reaccion con user y post
                @cfcreaction = Cfcreaction.new(cfcuser_id: @cfcuser.id, cfcpost_id:
                @cfcpost.id, kind: @kind)
        
                if @cfcreaction.save!
                format.html { redirect_to cfcpost_url(@cfcpost), notice: "Reaccionaste con éxito!" }
                else 
                format.html { redirect_to cfcpost_url(@cfcpost), notice: "Algo salio mal" }
                end
            end
        end
        end
    end 
end