# frozen_string_literal: true

class Posts::EditView < ApplicationView
  def view_template
    div(class: "mx-auto md:w-2/3 w-full") do
      h1(class: "font-bold text-4xl") { "Edit post" }

      div(class: "mx-auto") do
        render Posts::FormView.new(post: @post)

        link_to "Show this post", @post, class: "ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
        link_to "Back to posts", posts_path, class: "ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      end
    end
  end
end
