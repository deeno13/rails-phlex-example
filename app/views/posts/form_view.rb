# frozen_string_literal: true

class Posts::FormView < ApplicationView
  def view_template
    form_with(model: @post, class: "contents") do |form|
      if @post.errors.any?
        div(id: "error_explanation", class: "bg-red-50 text-red-500 px-3 py-2 font-medium rounded-lg mt-3") do
          h2 { pluralize(@post.errors.count, "error") }
          ul {
            @post.errors.each do |error|
              li { error.full_message }
            end
          }
        end
      end

      div(class: "my-5") do
        form.label :title
        form.text_field :title, class: "block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      end

      div(class: "my-5") do
        form.label :content
        form.textarea :content, rows: 4, class: "block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      end

      div(class: "inline") do
        form.submit class: "rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer"
      end
    end
  end
end
