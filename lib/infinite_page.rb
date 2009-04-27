include WillPaginate
include ActionView::Helpers::PrototypeHelper
include ActionView::Helpers::JavaScriptHelper
include ActionView::Helpers::TagHelper


module InfinitePage
  def infinite_page(collection = nil, options = {})
    unless WillPaginate::ViewHelpers.total_pages_for_collection(collection) <= 1
      options[:renderer] = 'InfinitePage::ScrollObserverRenderer'
      pagination = will_paginate(collection, options)
      options[:renderer] = 'WillPaginate::LinkRenderer'
      pagination_nojs = will_paginate(collection, options)
      pagination += "<noscript>"+pagination_nojs+"</noscript>"  unless pagination_nojs.nil?
    else
      js_string = ''
      js_string += options[:first]+";" unless  options[:first].nil? 
      js_string += options[:last] unless  options[:last].nil? 
      pagination = javascript_tag js_string unless  js_string.blank?
    end
  end
  
  class ScrollObserverRenderer < WillPaginate::LinkRenderer    
    def to_html
      if @collection.current_page<@collection.total_pages
        @options[:url] = @collection.next_page
        @options[:method] = :get if @options[:method].nil?              
        js_string = "InfinitePage.start_scroll_observing('"+escape_javascript(remote_function @options)+"');"      
        if @collection.current_page==1
          js_string += @options[:first] unless  @options[:first].nil?
        end
        js_string = javascript_tag js_string
      else
        javascript_tag @options[:last] unless  @options[:last].nil?              
      end
    end
    
    def protect_against_forgery?
      config = Rails::Configuration.new
      config.action_controller.allow_forgery_protection
    end
  end 
end

if defined?(Rails) and defined?(ActionController)
  return if ActionView::Base.instance_methods.include? 'infinite_page'
  ActionView::Base.send :include, InfinitePage
end
