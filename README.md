# MrYahooFinance

This gem enables you to get the company's settlement in annual and quarter.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mr_yahoo_finance'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mr_yahoo_finance

## Usage

```

yh = MrYahooFinance.get('YHOO') # pass the company symbol which you want

# example =>
{
  :annual=>
    [
      {
        :period=>"Dec 31, 2014",
        :sale=>4618133,
        :operating_profit=>142942,
        :net_income=>7521731
      },
      {
        :period=>"Dec 31, 2013",
        :sale=>4680380,
        :operating_profit=>589926,
        :net_income=>1366281
      },
      {
        :period=>"Dec 31, 2012",
        :sale=>4986566,
        :operating_profit=>566368,
        :net_income=>3945479
      }
    ],
  :quarterly=>
    [
      {
        :period=>"Sep 30, 2015",
        :sale=>1225673,
        :operating_profit=>-86312,
        :net_income=>76261
      },
      {
        :period=>"Jun 30, 2015",
        :sale=>1243265,
        :operating_profit=>-44794,
        :net_income=>-21554
      },
      {
        :period=>"Mar 31, 2015",
        :sale=>1225970,
        :operating_profit=>-87354,
        :net_income=>21198
      },
      {
        :period=>"Dec 31, 2014",
        :sale=>1253072,
        :operating_profit=>32154,
        :net_income=>166344
      }
    ]
}

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
