Gem::Specification.new do |s|
  s.name        = 'stock_grabber'
  s.version     = '1.0.0'
  s.date        = '2014-07-31'
  s.summary     = "Pulls stock information from Yahoo Finance given a stock ticker."
  s.description = File.read(File.join(File.dirname(__FILE__), 'README.markdown'))
  s.authors     = ["Tim Knight"]
  s.email       = 'tim.knight@acst.org'
  s.files       = ["lib/stock_grabber.rb"]
  s.homepage    = 'https://github.com/timknight/stock_grabber'
  s.license     = 'MIT'
end