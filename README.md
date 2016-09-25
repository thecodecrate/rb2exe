# Ruby to EXE

Turn ruby scripts into portable executable apps.

## Installation

```ruby
gem install rb2exe
```

## Usage

```bash
rb2exe script.rb <optional folder to include> <optional output filename>
```

## Usage Example:
```bash
mkdir test
cd test
echo "puts 'Hello world'" > test.rb
rb2exe test.rb
./test
```

## Security

rb2exe DOESN'T protects your source code.

In fact, the produced executable file contains all your source files and THEY CAN BE EASILY EXTRACTED.

rb2exe just packages your source files (plus a stand-alone ruby) in an auto-extract zip file. It doesn't protects your code in any way.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/loureirorg/rb2exe.

## TODO

* Allow ruby versions other than 2.2.2;
* Rails support;
* Gemfile support;
* Windows / OSX executable output;
* Testing suite;
