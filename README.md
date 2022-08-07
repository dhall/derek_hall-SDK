

# LOTR SDK

Ruby client for the LOTR api located at https://the-one-api.dev/

## Installation
	gem install derek_hall-SDK

## Usage
In your ruby file

	gem 'derek_hall-sdk'
	require 'lotr/sdk'

	# signup for an api key here https://the-one-api.dev/
	# pass in key directly or export an environment variable
	client = Lotr::Sdk::Client.new(ENV['KEY'])

	# grab a random quote
	random_quote = client.quote_list.data.sample
	puts "Who said #{random_quote['dialog']}?"

	# get the name and race of the character who was quoted
	character = client.character(id: random_quote['character']).data.first
	puts "Answer: #{character['name']} - #{character['race']}"

	# gather all pages of quote data

	full_quote_data = []
	next_page_number = 1
	while next_page_number
	  quote_list = client.quote_list(page:next_page_number)
	  full_quote_data += quote_list.data
	  next_page_number = quote_list.next_page_number
	end

	puts "Total number of quotes: #{full_quote_data.size}"

## Supported commands

* movie_list
* movie
* character_list
* character
* book_list
* book
* quote_list
* quote

## Local development
	git clone https://github.com/dhall/derek_hall-SDK.git
	cd derek_hall-SDK
	bundle

Run tests

	rake spec

Build gem

	rake build
