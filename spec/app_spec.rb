# encoding: utf-8

require_relative 'spec_helper'
require_relative 'support/story_helpers'
require 'json'

encoded_url = URI.encode('/api/v1/station/新竹地區.json')
URI.parse(encoded_url)

describe 'Busgogo Stories' do
  include StoryHelpers

  describe 'Getting the root of the service' do
    it 'Should return ok' do
      get '/'
      last_response.must_be :ok?
      last_response.body.must_match(/ok/)
    end
  end

  describe 'Getting busgogo information' do
    it 'should return news' do
      get encoded_url
      last_response.must_be :ok?
      
    end

    it 'should return 404 for not a specific number' do
      get "/api/v1/#{random_str(20)}.json"
      last_response.must_be :not_found?
    end
  end

  
end