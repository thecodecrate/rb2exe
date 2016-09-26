# Ruby to EXE

Turn ruby scripts into portable executable apps.

## Installation

```ruby
gem install rb2exe
```

## Usage

```bash
rb2exe RUBY_SCRIPT [options]
    -q, --quiet                      Do not run verbosely
    -a, --add FOLDER                 Add an entire folder (eg. ".")
    -o, --output OUTPUT              Output executable filename
    -h, --help                       Help
```

## Example
```bash
echo "puts 'Hello world'" > test.rb

rb2exe test.rb
./test
```


## Example II - Multi source project
```bash
mkdir test
cd test
echo "STR = 'Hello world'" > a.rb
echo "load 'a.rb'" > main.rb
echo "puts STR" >> main.rb

rb2exe main.rb --add .
./main
```

## Example III - Gemfile support
```bash
mkdir test
cd test
echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'faker'" >> Gemfile
echo "require 'faker'" > a.rb
echo 'puts "Hello #{Faker::Name.name}"' >> a.rb

rb2exe a.rb --add .
./a
```


## Security

rb2exe DOESN'T protects your source code.

In fact, the produced executable file contains all the source files and THEY CAN BE EASILY EXTRACTED.

You can see the list of the added source files when you run rb2exe.

rb2exe just packages your source files (plus a stand-alone ruby) in an auto-extract zip file. It doesn't protects your code in any way.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/loureirorg/rb2exe.


## TODO

* Allow ruby versions other than 2.2.2;
* Rails support;
* Windows / OSX executable output;
* Testing suite;

If you need the above features, please take a look on my article, where I explain how to achieve them manually:
http://www.learnwithdaniel.com/2016/08/ruby-to-portable-exe-app/
