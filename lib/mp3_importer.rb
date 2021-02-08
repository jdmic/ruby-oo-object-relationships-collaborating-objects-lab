require "pry"
class MP3Importer

    attr_reader :path

    def initialize(path)
    @path = path
    end

    def files
        array = Dir.glob("#{path}/*.mp3")
        answer_array = []
        array.each {|file_with_path| answer_array << file_with_path.delete_prefix("#{path}/")}
        answer_array
    end

    def import
        files.each{ |filename| Song.new_by_filename(filename) }
    end
    
end