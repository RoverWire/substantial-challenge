# Board Parser

![Ruby CI](https://github.com/RoverWire/substantial-challenge/actions/workflows/ruby.yml/badge.svg)

This script parses soccer games data from a text file and sort teams by points descending and team name ascending as described on the [original problem](problem.md)

## Pre Requirements

- Ruby > 2.7.1
- Unix based OS [Linux, MacOS]

## Setup

1.- Clone this repository in your local machine

```shell
$ git clone git@github.com:substantial/developer-candidate-roverwire.git
```

2.- Install dependencies

```shell
$ bundle install
```
That's it!

## Usage

There are two ways to use the parser tool:

```shell
# Using plain ruby CLI
$ ruby parse.rb
```

```shell
# Using rake task
$ rake parse

```

### CLI

To display options available just type `ruby parse.rb -h` to show usage reference. Also when no option is provided this information will be displayed.

```shell
$ ruby pare.rb 
Parse soccer games information from a file
Usage: parse.rb [options]

Specific options:
    -i, --input [STRING]             Provides a file input path
    -h, --help                       Show this message
```

To parse files, use the `-i` or  `--input` option to provide a file input.

```shell
$ ruby parse.rb -i path/to/input-file.txt
1. Tarantulas, 6 pts
2. Lions, 5 pts
3. FC Awesome, 1 pt
3. Snakes, 1 pt
5. Grouches, 0 pts
```
### Rake Task

Rake task usage is very similar, the main difference is you need to add an extra double dash on the commands

```shell
$ rake parse -- -h
Usage: rake parse -- [options]
    -i, --input [STRING]             Provides a file input path
    -h, --help                       Show this message
```

To parsing files using rake, just type:

```shell
$ rake parse -- -i path/to/input-file.txt
```

## Testing

To run the specs / unit testing there are two options:

```shell
$ rspec

# OR

$ rake spec
```

This project includes rake tasks for Rspec and Rubocop. Both are set as default rake task.

```shell
# To run specs only
$ rake spec

# To run rubocop linter
$ rake rubocop

# For run both
$ rake
```
