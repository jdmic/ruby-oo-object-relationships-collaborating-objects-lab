require "pry"

class Artist
    
    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def name=(name)
        @name=name
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        #binding.pry

        found = self.all.find {|artist| artist.name == name}
            if found
                found
            else 
                Artist.new(name)
            end
    end

    def print_songs
        singer = self
        Song.all.each do |song| 
            #binding.pry
            if song.artist == singer
                puts song.name
            end
        end
    end
end