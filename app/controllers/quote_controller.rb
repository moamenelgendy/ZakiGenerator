class QuoteController < ApplicationController
  
  def list_users
  	@users = User.all
  end

   def deleteUser
  	User.find_by_id(params[:id]).destroy
  	flash[:notice]= "successfully deleted"
  	redirect_to(:action => 'list_users')
  end

  def list
  	@quotes = Quote.all
  end

  def quoteInput
  end

  def deleteQuote
  	Quote.find_by_id(params[:id]).destroy
  	flash[:notice]= "successfully deleted"
  	redirect_to(:action => 'list' )
  end

  def saveQuote
  	quote = Quote.new(params[:info])
  	if quote.save
  		flash[:notice]= "successfully saved"
  		redirect_to(:action => 'quoteInput' )
  	end	
  end

end
