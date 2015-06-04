var current_json_url = location.href + 'vegetables.json'

$.get(current_json_url, function(veg_data) {
  veg_data.names.forEach(function(vegetable) {
    $("." + vegetable).click(function() {
      alert( veg_data.ripe_span[vegetable][0].start_day + " - " + veg_data.ripe_span[vegetable][0].end_day);
    });
  });
});
