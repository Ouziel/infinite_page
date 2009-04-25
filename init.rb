require 'infinite_page'

if defined?(Rails) and defined?(ActionController)
  return if ActionView::Base.instance_methods.include? 'infinite_page'
  ActionView::Base.send :include, InfinitePage
end

