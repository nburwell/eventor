# Eventor

Ruby script to generate ICS files, suitable for importing into Apple Calendar, parsed from bulk data. An example application of this is to generate and import an event for every sports game in a season.

## Setup

```
bundle install
```

Note: tested with Ruby 2.6.6, using `rbenv`

## Usage

* Insert data into `input.txt`
* Ensure you have created a parser class for handling the data
* Instantiate an instance of the class in `Eventor#make_events`

Run the file:
```
ruby eventor.rb
```

To import into Apple Calendar:
```
open events.ics
```
