And(/^(?:I expect a Google map to load|the map has been loaded)$/) do
  sleep(5) until page.evaluate_script('$.active') == 0
  expect(page).to have_css '#map .gm-style'
end
