# Sign

[![Gem Version](https://badge.fury.io/rb/sign.svg)](https://badge.fury.io/rb/sign)
[![Travis CI](https://img.shields.io/travis/evanscloud/sign.svg)](https://travis-ci.org/evanscloud/sign)
[![MIT License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT)

**tl;dr**: Generate a license for your project in less than 10 seconds.

Let's say you need an MIT license for your project. You would have to:

1. Search for the license on the web.
2. Copy it.
3. Create a blank text file.
4. Paste the license into the text file.
5. Save and close the file.
6. Forget to change the name and year so open the file, make edits, and then close again.
7. Ugh.

This process can take about 1-2 minutes, precious time that you can be using for more important things. Well no more! Now with Sign, all you have to do is:

1. Install gem.
2. Enter `sign mit`.
3. Profit.

Sign creates a license in your current project directory for you in a matter of seconds. **No need for an internet connection either!**

## Installation

The recommended way to install this gem:

```
gem install sign
```

Otherwise, add this line to your application's Gemfile:

```ruby
gem 'sign'
```

And then execute `bundle`.

## Usage

There are a wide range of licenses available (provided by [Open Source Initiative](https://opensource.org/)). The format is `sign <license name> --name=[NAME] --year=[YEAR]`. If either name or year are needed and not provided, it will automatically try to detect a `.gitconfig` file on your system and grab the name from there. The year will automatically be set to the current year too.

### Examples

To see a list of available licenses:

```
sign --list
```

To create an MIT license with name and year:

```
sign mit --name="Rick Deckard" --year="2049"
```

To create an MIT license with automatic name and year:

```
sign mit
```

## Updates

Check [CHANGELOG](https://github.com/evanscloud/sign/blob/master/CHANGELOG.md) for all updates.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Suggestions, bug reports and pull requests are encouraged for those who would like to take part in improving this gem at [https://github.com/evanscloud/sign](https://github.com/evanscloud/sign). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org).

## License

MIT license - see [LICENSE](https://github.com/evanscloud/sign/blob/master/LICENSE) for details.
