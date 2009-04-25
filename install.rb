require 'fileutils'
 
FileUtils.cp File.dirname(__FILE__) + '/public/javascripts/infinite_page.js', File.dirname(__FILE__) + '/../../../public/javascripts/infinite_page.js'