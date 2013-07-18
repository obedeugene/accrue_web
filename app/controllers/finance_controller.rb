class FinanceController < ApplicationController

  def index
  end

  def about
  end

  def result
    @symbol = params[:symbol].upcase
    if @symbol.empty?
      flash[:error] = "Symbol can't be blank. Type it in."
      render :index
    else
      @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol]
      if @quote.lastTrade == 0
        flash[:error] = "Invalid symbol. Please type in a correct one."
        render :index
      end
    end 
  end

end

