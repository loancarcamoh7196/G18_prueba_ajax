class ClaimsController < ApplicationController

    def create
        @claim = Claim.new(claim_params)
        @claim.user_id = current_user.id
        @claim.company_id = params[:company_id]
        @claim.claim_date = Time.now
        
        @claim.save
        respond_to :js
        

        # if @claim.save
        #     redirect_to posts_path
        # else
        #     redirect_to posts_path, alert: 'Error. Intente nuevamente' 
        # end
    end
    
    private

    def claim_params
        params.require(:claim).permit(:affair, :description, :claim_date, :company_id, :user_id)
    end
end
