# DrawMe

This gem is used to generate state diagram for [AASM gem](https://github.com/aasm/aasm). This gem utilize Matsuda's [stateful_enum gem](https://github.com/amatsuda/stateful_enum) graph generator to generate AASM state diagram.

## Installation
1. Create a `doc` folder in your app root directory.

2. Add this line to your application's Gemfile:

```ruby
gem 'aasm'
gem 'stateful_enum'
gem 'draw_me'
```

3. And then execute:

    $ bundle


## Usage

    $ rails c
    2.4.0 :001 > to_draw = EmergencyPurchase.last
    2.4.0 :001 > to_draw.draw_me
    emergencypurchase_graph
    => 1

You should be able to find your graph in the doc folder in your root directory.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abigoroth/draw_me. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

