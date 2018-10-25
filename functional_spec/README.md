# A Parking Lot

The `Hello World` for Low Level Design and Object Oriented Design

# Functional Suite

`functional_spec/` contains the Rspec/Aruba based automated testing suite that validates the correctness of the program for the sample input and output.

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
parking_lot $ bin/setup
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
Now you can run `bin/run_functional_tests` or `bin/parking_lot`
parking_lot $
```

## Usage

You can run the full suite by
```
parking_lot $ bin/run_functional_specs
```
You can load the interactive mode of the program by
```
parking_lot $ bin/parking_lot
```
Entering a blank line will exit the program:

```
parking_lot $ bin/parking_lot
create_parking_lot 3      
Created a parking lot with 3 slots

parking_lot $
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

The ruby app is in the `functional_spec/app/lib` dir. It has its own specs. You can run it by running `rspec` in the `functional_spec/app` dir:

    parking_lot $ cd functional_spec/app/
    app $ rspec
    ..............

    Finished in 0.0044 seconds (files took 0.06989 seconds to load)
    14 examples, 0 failures
    app $



The classes in `app/models` behave like `ActiveRecord` models. Instead of storing the data in SQL they store it in memory via class variables.

All the code is written in TDD

I have tried to use both Object Oriented and Functional Progamming:
 - Classes try to model real world objects with only 1 reason to change.
 - Methods without side-effects just call `filter`, `map` kind of functional operators in a chain
