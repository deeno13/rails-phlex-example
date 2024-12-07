# frozen_string_literal: true

class Posts::ShowView < ApplicationView
  def initialize(notice: nil, post:)
    @notice = notice
    @post = post
  end

  def view_template
    div(class: "mx-auto md:w-2/3 w-full flex") do
      div(class: "mx-auto") do
        if flash[:notice].present?
          p(class: "py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block", id: "notice") do
            flash[:notice]
          end
        end

        render Posts::PostView.new(post: @post)

        link_to "Edit this post", edit_post_path(@post), class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
        link_to "Back to posts", posts_path, class: "ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
        div(class: "inline-block ml-2") do
          button_to "Destroy this post", @post, method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
        end
      end
    end
  end
end
