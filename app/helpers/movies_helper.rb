module MoviesHelper

    def trailer_link(movie)
        if movie.trailer_link != "No Trailer Available"
            tag.li link_to 'View Trailer', movie.trailer_link, target: '_blank'
        end
    end

    def comment_form(movie, comment)
        form_with(model: [movie, comment], local: true) do |f|
            f.text_field :content, :placeholder =>"Add Comment"
            f.submit :style => "display: none"
        end
    end
end
