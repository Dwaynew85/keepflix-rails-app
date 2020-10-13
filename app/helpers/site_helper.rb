module SiteHelper

    def my_movies_button(movie)
        if !current_user.movies.include?(movie)
            button_to "Add To My Movies", movie_path(movie), :method => "patch", :class => "add-button"
        elsif current_user.movies.include?(movie)
            button_to "Remove From My Movies", movie_path(movie), :method => "delete", :class => "remove-button"
        end
    end

    def delete_button(movie, comment)
        if comment.user.id == current_user.id
            button_to "X", movie_comment_path(movie, comment), :method => "delete", :class => "destroy"
        end
    end

    def edit_link(movie, comment)
        if comment.user.id == current_user.id
            link_to 'Edit', edit_movie_comment_path(movie, comment), :class => "edit"
        end
    end
end
