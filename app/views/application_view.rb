# frozen_string_literal: true

class ApplicationView < ApplicationComponent
  # The ApplicationView is an abstract class for all your views.

  # By default, it inherits from `ApplicationComponent`, but you
  # can change that to `Phlex::HTML` if you want to keep views and
  # components independent.

  Phlex::Rails::Helpers.constants.each do |constant|
    constant = Phlex::Rails::Helpers.const_get(constant)
    include constant if constant.is_a?(Module)
  end

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key}", value)
      # self.class.attr_reader key
    end
  end
end
