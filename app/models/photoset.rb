require 'flickr'

class Photoset

  PHOTOSET_CACHE_KEY = "photosets"
  
  def initialize(r, i)
    @remote = r
    @index = i
  end
  
  def self.all
    Rails.cache.fetch(PHOTOSET_CACHE_KEY) do
      flickr = Flickr::Api.new(APP_KEYS[:flickr])
      user = flickr.find_by_url(APP_CONFIG[:flickr][:url]);
      photosets = []
      user.photosets.select { |p| p.title =~ /^@/ }.sort_by { |p| p.title }.reverse.each_with_index do |p, i|
        photosets[i] = Photoset.new(p, i)
        photosets[i].photos
      end
      photosets
    end
  end
  
  def self.get(index)
    all[index.to_i]
  end
  
  def title
    @remote.title[1..-1]
  end
  
  def to_s
    @index.to_s
  end
  
  def method_missing(sym, *args, &block)
    @remote.send sym, *args, &block
  end
end