require_relative '../config/environment'
require 'pry'
p RestClient.get "https://api.discogs.com/database/search?q=Nirvana&key=RQiVIFhlSQUaqhURPhaW&secret=VHJtTwzPjtlEZUmGvUvdoAHlLaBzsqQv"