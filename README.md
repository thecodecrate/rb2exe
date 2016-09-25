# Ruby to EXE

Turn ruby scripts into portable executable apps.

## Installation

```ruby
gem install rb2exe
```

## Usage

```bash
rb2exe APP_WORKING_DIRECTORY APP_MAIN_FILE OUTPUT_FILE
rb2exe . test.rb test.sh
```

## Usage Example:
```bash
mkdir test
cd test
echo "puts 'Hello world'" > test.rb
rb2exe . test.rb test.sh
./test.sh
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/loureirorg/rb2exe.

## TODO

* Allow ruby versions other than 2.2.2;
* Pack web applications;
