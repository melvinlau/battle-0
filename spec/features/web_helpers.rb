def sign_in_and_play
  visit('/')
  fill_in :player_1, with: 'Charmander'
  fill_in :player_2, with: 'Squirtle'
  click_button "Ready!"
end

def single_player_sign_in_and_play
  visit('/')
  click_button "Single Player"
  fill_in :player, with: 'Billy'
  click_button "Ready!"
end

def current_player_attacks
  click_button("Attack")
  click_button('OK')
end

def computer_attacks
  click_button("Compy's Turn")
  click_button("OK")
end
