# frozen_string_literal: true

class Posts::IndexView < ApplicationView
  attr_reader :posts

  def initialize(posts:)
    @posts = posts
  end

  def view_template
    div(class: "w-full") do
      if flash.present?
        p(class: "py-2 px-3 bg-red-50 mb-5 text-red-500 font-medium rounded-lg inline-block", id: "notice") do
          flash[:warning]
        end
      end

      content_for :title, "Posts"

      div(class: "flex justify-between items-center") do
        h1(class: "font-bold text-4xl") { "Posts" }
        link_to "New post", new_post_path, class: "rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      end

      div(id: "posts", class: "min-w-full") do
        posts.each do |post|
          render post
          p {
            link_to "Show this post", post, class: "ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
          }
        end
      end
    end
  end
end
