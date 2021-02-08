require "pry"
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name=name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist = artist
    end

    def self.new_by_filename(file_path)
        name = file_path.split(" - ")[1]
        artist = file_path.split(" - ")[0]
        song = self.new(name)
        song.artist_name=(artist)
        song
    end 
end
