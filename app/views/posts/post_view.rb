# frozen_string_literal: true

class Posts::PostView < ApplicationView
  def initialize(post:)
    @post = post
  end

  def view_template
    div(id: dom_id(@post)) do
      p(class: "my-5") do
        strong(class: "block font-medium mb-1") { "Title:" }
        @post.title
      end

      p(class: "my-5") do
        strong(class: "block font-medium mb-1") { "Content:" }
        @post.content
      end
    end
  end
end
