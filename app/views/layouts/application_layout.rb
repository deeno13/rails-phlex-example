# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def view_template(&block)
    doctype

    html do
      head do
        title { content_for(:title) || "Phlex Example" }
        meta name: "viewport", content: "width=device-width,initial-scale=1"
        meta name: "apple-mobile-web-app-capable", content: "yes"
        meta name: "mobile-web-app-capable", content: "yes"
        csp_meta_tag
        csrf_meta_tags

        yield :head

        # Enable PWA manifest for installable apps (make sure to enable in config/routes.rb too!)
        # tag.link rel: "manifest", href: pwa_manifest_path(format: :json)

        link rel: "icon", href: "/icon.png", type: "image/png"
        link rel: "icon", href: "/icon.svg", type: "image/svg+xml"
        link rel: "apple-touch-icon", href: "/icon.png"

        # Includes all stylesheet files in app/assets/stylesheets
        stylesheet_link_tag "tailwind", "inter-font", data_turbo_track: "reload"
        stylesheet_link_tag :app, data_turbo_track: "reload"
        javascript_importmap_tags
      end

      body do
        main(class: "container mx-auto mt-28 px-5 flex") do
          yield
        end
      end
    end
  end
end
