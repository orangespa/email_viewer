class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html { redirect_to emails_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
  end

private

  def set_email 
    @email = Email.find(params[:id])
  end
  
  def email_params
    params.require(:email).permit(:object, :body)
  end
end
