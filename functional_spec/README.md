# Functional Suite

`functional_spec/` contains the Rspec/Aruba based automated testing suite that will validate the correctness of your program for the sample input and output.

Please to add specs as needed when building your solution.

We do not support Windows at this point in time. If you don't have access to an OSX or Linux machine, we recommend  setting up a Linux machine you can develop against using something like [VirtualBox](https://www.virtualbox.org/) or [Docker](https://docs.docker.com/docker-for-windows/#test-your-installation).

This needs [Ruby to be installed](https://www.ruby-lang.org/en/documentation/installation/), followed by some libraries. The steps are listed below.

## Setup

First, install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and bundler. Then run the following commands under the `bin` dir.

```
bin $ ruby -v # confirm Ruby present
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]
bin $ gem install bundler # install bundler to manage dependencies
Successfully installed bundler-1.16.1
Parsing documentation for bundler-1.16.1
Done installing documentation for bundler after 2 seconds
1 gem installed
bin $

```

load the `setup` script:

```
bin $ source setup
...
...
Bundle complete! 4 Gemfile dependencies, 23 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
running unit tests
..............

Finished in 0.00444 seconds (files took 0.07245 seconds to load)
14 examples, 0 failures

running functional tests
.......

Finished in 5.83 seconds (files took 0.12592 seconds to load)
7 examples, 0 failures

Setup complete! All tests passed
Now you can run `run_functional_tests` or `parking_lot`
bin $
```

## Usage

You can run the full suite from any dir by doing
```
bin $ run_functional_specs
```
You can load the interactive mode of the program from any dir by doing
```
bin $ parking_lot
```
Entering a blank line will exit the program:

```
bin $ parking_lot
create_parking_lot 3      
Created a parking lot with 3 slots

bin $
```

You can run the full suite directly from `parking_lot/functional_spec` by doing
```
parking_lot/functional_spec $ bundle exec rake spec:functional
```

You can run a specific test from `parking_lot/functional_spec` by providing the spec file and line number. In this example we're running the `can create a parking lot` test.
```
parking_lot/functional_spec $ PATH=$PATH:../bin bundle exec rspec spec/parking_lot_spec.rb:5
```


## Implementation

The ruby app is in the `functional_spec/lib/app` dir. It has its own specs.

The classes in `app/models` behave like `ActiveRecord` models. Instead of storing the data in SQL they store it in memory via class variables.

All the code is written in TDD

I have tried to use both Object Oriented and Functional Progamming:
 - Classes try to model real world objects with only 1 reason to change.
 - Methods without side-effects just call `filter`, `map` kind of functional operators in a chain
