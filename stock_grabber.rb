#!/usr/bin/env ruby

class StockGrabber
  require 'net/http'

  def initialize(stock)
    @pricesheet = Net::HTTP.get('download.finance.yahoo.com', '/d/quotes.csv?s='+stock+'&f=snl1d1t1c1ohgv&e=.csv').chop.split(",")
  end
  
  def symbol
    @pricesheet[0].gsub("\"","")
  end
  
  def company
    @pricesheet[1].gsub("\"","")
  end
  
  def last_traded_price
    @pricesheet[2]
  end
  
  def last_traded_date
    @pricesheet[3].gsub("\"","")
  end
  
  def last_traded_time
    @pricesheet[4].gsub("\"","")
  end
  
  def change
    @pricesheet[5]
  end
  
  def opening_price
    @pricesheet[6]
  end
  
  def days_high
    @pricesheet[7]
  end
  
  def days_low
    @pricesheet[8]
  end
  
  def volume
    @pricesheet[9]
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