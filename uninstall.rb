require 'fileutils'

FileUtils.rm %{infinite_page.js}.collect { |f| File.dirname(__FILE__) + '/../../../public/javascripts/' + f }