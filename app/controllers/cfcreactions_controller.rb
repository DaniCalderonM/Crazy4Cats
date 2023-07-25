class CfcreactionsController < ApplicationController
    before_action :authenticate_cfcuser!

    def new_cfcuser_cfcreaction
        @cfcuser = current_cfcuser
        @cfcpost = Cfcpost.find(params[:cfcpost_id])
        cfcreaction = Cfcreaction.find_by(cfcuser_id: @cfcuser.id, cfcpost_id: @cfcpost.id)
        if cfcreaction
        return flash.now[:alert] = 'Ya reaccionaste a esta publicación!'
        else
        @new_cfcreaction = Cfcreaction.new(cfcuser_id: @cfcuser.id, cfcpost_id: @cfcpost.id, kind: params[:kind])
        respond_to do |format|
        if @new_cfcreaction.save!
        format.html { redirect_to cfcpost_url(@cfcpost), notice: "Reaccionaste con éxito!" }
        else
        format.html { redirect_to cfcpost_url(@cfcpost), status: :unprocessable_entity }
        end
        end
        end
    end




    # def new_cfcuser_cfcreaction
    #     @cfcuser = current_cfcuser
    #     @cfcpost = Cfcpost.find(params[:cfcpost_id]) 
    #     if params[:cfcpost_id]
    #     @kind = params[:kind]
    #     respond_to do |format|

    #         cfcreaction_cfcpost = Cfcreaction.find_by(cfcuser_id: @cfcuser.id, cfcpost_id: @cfcpost.id)
    #         @cfcreaction = Cfcreaction.new(cfcuser_id: @cfcuser.id, cfcpost_id:
    #         @cfcpost.id, kind: @kind)
    #             if @cfcuser_id == @cfcuser_id
    #                 format.html { redirect_to cfcpost_url(@cfcpost), notice: 'Ya reaccionaste a esta publicación!' }
                
    #             #Creacion de reaccion con user y post
                
    #             if @cfcreaction.save!
    #             format.html { redirect_to cfcpost_url(@cfcpost), notice: "Reaccionaste con éxito!" }
    #             else 
    #             format.html { redirect_to cfcpost_url(@cfcpost), notice: "Algo salio mal" }
    #             end
    #         end
    #     end
    #     end
    # end 
end