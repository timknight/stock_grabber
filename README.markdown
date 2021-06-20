This project requires the use of Yahoo Finance's API from `download.finance.yahoo.com` which as of January 2018 is no longer available. This project has been archived and moved over to read-only for reference use only.

# Readme File

Pulls stock information from Yahoo Finance given a stock ticker.

## Installation

`gem install stock_grabber`

## Usage

Require the gem and pass the stock symbol into a new instance of the Class.

```
require 'stock_grabber'
stock = StockGrabber.new("GOOG")

puts stock.symbol               # => GOOG
puts stock.company              # => Google Inc.
puts stock.last_traded_price    # => 571.60
puts stock.last_traded_date     # => 7/31/2014
puts stock.last_traded_time     # => 4:00pm
puts stock.change               # => -15.82
puts stock.opening_price        # => 580.60
puts stock.days_high            # => 583.6499
puts stock.days_low             # => 570.00
puts stock.volume               # => 2099516
puts stock.exchange             # => US
```
