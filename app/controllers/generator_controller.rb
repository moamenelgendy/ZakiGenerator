class GeneratorController < ApplicationController
  def input
  end
  def show
  	user = User.new(:name => params[:info][:name], :number => params[:info][:number])
    if user.name.blank? or user.number.blank?
      flash[:notice] = 'You should enter all fields'
      render('input')
    else
    	if user.save
    		redirect_to(:action => 'view_quote' , :name => user.name, :number => user.number, :show_name => params[:info][:show_name] )
    	else
    		render('input')
    	end
    end
  end
  def view_quote
    quotes = Quote.all
    num = quotes.size-1
    id = (0..num).to_a.sample

    @quote = quotes[id].quote

    quotes = Quote.all
    num = quotes.size-1
    id = (0..num).to_a.sample


    # require 'net/http'
    # temp_token = 'CAACOmfL9xHoBAE3dvp1qznsMpTeEmIHnBmKHHiqP06hT3XyAlrgT2E3P1SnZBIa9FGoluXdRLsdydGB13OdCq2G2TuqEoOCRRtIH2c1iD7xcDwvwBMW7fUd6BCam9J220slccxHnLXZCGa3tPCZCEIWPuIykLOYkCDxSc3nLexBwlIi0GUaqFfbkWXLGd0ZD'
    # app_id = '156791857857658'
    # app_secret = '282ea9f29d1036e0abfed37f6d687f6e'
    # puts "https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&client_secret=#{app_secret}&grant_type=fb_exchange_token&fb_exchange_token=#{temp_token}"
    # url = URI.parse("https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&client_secret=#{app_secret}&grant_type=fb_exchange_token&fb_exchange_token=#{temp_token}")
    # req = Net::HTTP::Get.new(url.path)
    # res = Net::HTTP.start(url.host, url.port) {|http|
    #   http.request(req)
    # }
    # puts res.body

    @quote = quotes[id].quote
    pages = FbGraph::User.me('CAACOmfL9xHoBAMEk2qtw0QvlgqxmXrHwZA8mz2XZAYZAZCW4ko5M7UZAVJPcJrgB0ldp33WPAth8ztTsVP3TszyONnKlz0wskHgrydZCDVmZAYRpss0g42ZAZAJ7qlfvqAosLcYM2LZBjoGZBWEMKcWt46j9zGGt3V5q23P5R0MZBPZC43ZArDvvBjHiZBm').accounts.first
    if params[:show_name] == "1"
      pages.feed!(
      :message => params[:name] << ": " << @quote,
      )
    else
      pages.feed!(
      :message => params[:number].to_s << ": " << @quote,
      )
    end
  end
end

  