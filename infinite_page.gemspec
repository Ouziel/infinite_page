Gem::Specification.new do |s|
  s.name    = 'infinite_page'
  s.version = '0.1'
  s.date    = '2009-04-27'
  
  s.summary = "Yet another unobtrusive javascript paging plugin for Ruby on Rails. Based on will_paginate."
  s.description = "Yet another unobtrusive javascript paging plugin for Ruby on Rails. Based on will_paginate."
  
  s.authors  = ['Ouziel Slama']
  s.email    = 'ouziel@gmail.com'
  s.homepage = 'http://github.com/Ouziel/infinite_page'
  
  s.has_rdoc = false
  s.extra_rdoc_files = ['README.rdoc']
  
  s.add_dependency(%q<mislav-will_paginate>, [">= 2.3.8"])
  s.files = %w(init.rb install.rb MIT-LICENSE README.rdoc uninstall.rb infinite_page.gemspec lib/infinite_page.rb public/javascripts/infinite_page.js)
end
