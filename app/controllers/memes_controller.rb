require 'mini_magick'

class MemesController < ApplicationController
    
    IMAGE = "memes_image"
    
    def index
    end

    def create
        puts "text was #{params[:text]}"

        File.open(IMAGE, "wb") do |file|
            file.write(params[:image].read)
        end


        MiniMagick::Tool::Convert.new do |magick|
            magick << IMAGE
            magick.pointsize "46"
            magick.gravity "South"
            magick.bordercolor "LimeGreen"
            magick.border "0x50"
            magick.annotate "+0+0" 
            magick << "#{params[:text]}"
            magick << "output.jpg" 
        end
        send_file 'output.jpg'
    end

end

# convert output.jpg -pointsize 46 -gravity South -bordercolor LimeGreen -border 0x0x0x50 -annotate +0+0 "hello" new.jpg
# convert memes_image -pointsize 46 -gravity South -bordercolor LimeGreen -border 0x50 -annotate +0+0 hello output.jpg

