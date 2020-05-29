# SepaReasonCodes

Welcome to SepaReasonCodes! 

This is a absolutely minimal gem to work with SEPA Reason Codes.

`Reason Codes` are used in exception handling in SEPA Direct Debit (SDD). These codes
indicates reasons for why a transaction failure has happened. You may use this codes if you are parsing bank statements or handling SEPA transactions.

We have created a Ruby package where you may easily access and work with them.

If you want to know more about them, read more [here](https://www.europeanpaymentscouncil.eu/sites/default/files/kb/file/2018-09/EPC173-14%20v4.1%20Guidance%20on%20Reason%20Codes%20for%20SDD%20R-transactions.pdf)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sepa_reason_codes'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sepa_reason_codes

## Usage

No magic here! Just pass in the reason code and get back the struct with all required information.

```ruby
reason_code = SepaReasonCodes.find("AC01")

puts reason_code.code # AC01
puts reason_code.iso_name # Incorrect Account Number
puts reason_code.description # Account number is invalid or missing.
puts reason_code.probable_status # declined
```

SepaReasonCodes does not have any dependency or magic. Just check `lib/reason_codes.yml` to see the list of all reason codes.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ramblingcode/sepa_reason_codes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ramblingcode/sepa_reason_codes/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SepaReasonCodes project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/sepa_reason_codes/blob/master/CODE_OF_CONDUCT.md).
