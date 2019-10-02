def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Charmander'
  fill_in :player_2_name, with: 'Squirtle'
  click_button "Ready!"
end