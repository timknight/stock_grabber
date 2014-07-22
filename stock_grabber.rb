class StockGrabber
  require 'net/http'
  require 'csv'

  attr_reader   :symbol, :company, :last_traded_price, :last_traded_date, 
                :last_traded_time, :change, :opening_price, :days_high, 
                :days_low, :volume

  def initialize(stock)
    pricesheet         = get stock
    @symbol            = pricesheet[0]
    @company           = pricesheet[1]
    @last_traded_price = pricesheet[2]
    @last_traded_date  = pricesheet[3]
    @last_traded_time  = pricesheet[4]
    @change            = pricesheet[5]
    @opening_price     = pricesheet[6]
    @days_high         = pricesheet[7]
    @days_low          = pricesheet[8]
    @volume            = pricesheet[9]
    @exchange          = exchange
  end

  def exchange
    case symbol.split(".").last
      when "M"  then "Montreal"
      when "V"  then "Vancouver"
      when "TO" then "Toronto"
      when "AL" then "Alberta"
      else "US"
    end
  end

  private ## ---------------------------------------------------------------

  def get(stock)
    Net::HTTP.get("download.finance.yahoo.com", "/d/quotes.csv?s=#{stock}&f=snl1d1t1c1ohgv&e=.csv").parse_csv
  end

end