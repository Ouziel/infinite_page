var InfinitePage = {
  distance_from_bottom_to_activate: 100,
  initialize: function() {
    Event.observe(window,"load", function() {
      window.scrollTo(0,0);  
      InfinitePage.initialized = true;	  
    })
  },
  load_next_page: function() {      
  	eval(InfinitePage.remote_function);
  },
  scroll_diff: function() {
    return $(document.body).getHeight() - document.viewport.getHeight();
  },
  near_to_bottom: function() {
  	scrollOffsets =  document.viewport.getScrollOffsets();
    return (InfinitePage.scroll_diff()-scrollOffsets.top)<InfinitePage.distance_from_bottom_to_activate;
  },
  scroll_observer: function() {           
    if (InfinitePage.near_to_bottom())
    {      
      Event.stopObserving(window, "scroll", InfinitePage.scroll_observer);
      InfinitePage.load_next_page();
    } 
  },
  scroll_observing: function() {    
      if (InfinitePage.on_load_scroll_to_top) {
        window.scrollTo(0,0);
        InfinitePage.on_load_scroll_to_top = false;
      }      
      if (InfinitePage.scroll_diff()>InfinitePage.distance_from_bottom_to_activate) {            
        Event.observe(window, "scroll", InfinitePage.scroll_observer);
      } else {
        InfinitePage.on_load_scroll_to_top = true
        InfinitePage.load_next_page();      
      }
  },
  start_scroll_observing: function(remote_function) {    
    InfinitePage.remote_function = remote_function; 
    if (InfinitePage.initialized) InfinitePage.scroll_observing();
    else Event.observe(window,"load",InfinitePage.scroll_observing);
  }
};
InfinitePage.initialize();