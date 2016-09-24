# Ruby to EXE

Turn ruby scripts into portable executable apps.

## Installation

```ruby
gem install rb2exe
```

## Usage

rb2exe <app directory> <app main file> <output>
```bash
mkdir test
cd test
echo "puts 'Hello world'" > test.rb
rb2exe . test.rb test.sh
./test.sh
```

## WARNING
The entire <app directory> will be packed!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/loureirorg/rb2exe.

## TODO

* Allow ruby versions other than 2.2.2;
* Pack web applications;
