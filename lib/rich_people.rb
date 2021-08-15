# frozen_string_literal: true
require 'nokogiri'
require 'open-uri'
require 'awesome_print'
require_relative "rich_people/version"
require_relative "rich_people/people"
require_relative "rich_people/scraper"
require_relative "rich_people/cli"

module RichPeople
  class Error < StandardError; end
  # Your code goes here...
end
