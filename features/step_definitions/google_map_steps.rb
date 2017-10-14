And(/^(?:I expect a Google map to load|the map has been loaded)$/) do
  sleep(5) until page.evaluate_script('$.active') == 0
  expect(page).to have_css '#map .gm-style'
end

Then('I should see a pin on the map') do
  markers_count = page.evaluate_script('map.markers.length;')
  expect(markers_count).to eq 1
end

Then(/^my location should be approximately: "([^"]*)" lat and "([^"]*)" lng$/) do |lat, lng|
  ACCEPTED_CENTER_OFFSET = 0.2
  center_lat = page.evaluate_script('map.getCenter().lat();')
  center_lng = page.evaluate_script('map.getCenter().lng();')
  expect(center_lat).to be_within(ACCEPTED_CENTER_OFFSET).of(lat.to_f)
  expect(center_lng).to be_within(ACCEPTED_CENTER_OFFSET).of(lng.to_f)
end

And(/^the marker location should be approximately: "([^"]*)" lat and "([^"]*)" lng$/) do |lat, lng|
  ACCEPTED_MARKER_OFFSET = 0.2
  marker_lat = page.evaluate_script('map.markers[0].position.lat();')
  marker_lng = page.evaluate_script('map.markers[0].position.lng();')
  expect(marker_lat).to be_within(ACCEPTED_MARKER_OFFSET).of(lat.to_f)
  expect(marker_lng).to be_within(ACCEPTED_MARKER_OFFSET).of(lng.to_f)
end