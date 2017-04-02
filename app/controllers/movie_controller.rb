class MovieController < ApplicationController
    @@api_url = 'http://www.omdbapi.com/?t='

    def new_movie
        require ('json')
        require ('open-uri')
        
        title = params['title']
        page = open(@@api_url + new.title)
        info = page.read
        movie = JSON.parse(info)
        
        if movie['Response'] == "True"
        new=List.new
        new.title = title
        new.save
    else 
        puts "nono"
    end
        redirect_to '/'
    end


    def index
        require ('json')
        require ('open-uri')
        movie_list = List.all
    
    @movie_info = []
    
    movie_list.each do |movie|
            temp_url = @@api_url + movie.title
            info_page=open(temp_url)
            data = info_page.read
            @movie_info << JSON.parse(data)
    end

    end
end
