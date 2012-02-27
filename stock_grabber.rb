class StockGrabber
  require 'net/http'
  attr_accessor :symbol, :company, :last_traded_price, :last_traded_date, :last_traded_time, :change, :opening_price, :days_high, :days_low, :volume, :exchange

  def initialize(stock)
    pricesheet          = Net::HTTP.get('download.finance.yahoo.com', '/d/quotes.csv?s='+stock+'&f=snl1d1t1c1ohgv&e=.csv').chop.split(",")
    @symbol             = pricesheet[0].gsub("\"","")
    @company            = pricesheet[1].gsub("\"","")
    @last_traded_price  = pricesheet[2]
    @last_traded_date   = pricesheet[3].gsub("\"","")
    @last_traded_time   = pricesheet[4].gsub("\"","")
    @change             = pricesheet[5]
    @opening_price      = pricesheet[6]
    @days_high          = pricesheet[7]
    @days_low           = pricesheet[8]
    @volume             = pricesheet[9]
    @exchange           = exchange
  end

  def exchange
    case
      when self.symbol[-2,2] == ".M"   then "Montreal"
      when self.symbol[-2,2] == ".V"   then "Vancouver"
      when self.symbol[-3,3] == ".TO"  then "Toronto"
      when self.symbol[-3,3] == ".AL"  then "Alberta"
      else "US"
    end
  end
end