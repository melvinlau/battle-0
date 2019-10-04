feature "Attack" do

  scenario 'Player 1 attacks player 2 and gets confirmation' do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content 'Charmander attacked Squirtle'
  end

  scenario 'Player 2 attacks player 1 and gets confirmation' do
    sign_in_and_play
    current_player_attacks
    click_button("Attack")
    expect(page).not_to have_content 'Charmander attacked Squirtle'
    expect(page).to have_content 'Squirtle attacked Charmander'
  end




  scenario 'Player 1 attacks player 2 and reduces Player 2 HP' do
    sign_in_and_play
    allow_any_instance_of(Object).to receive(:rand) { 5 }
    current_player_attacks
    expect(page).not_to have_content 'Squirtle: 100HP'
    expect(page).to have_content 'Squirtle: 90HP'
  end

  scenario 'Player 2 attacks player 1 and reduces Player 1 HP' do
    sign_in_and_play
    allow_any_instance_of(Object).to receive(:rand) { 5 }
    current_player_attacks
    current_player_attacks
    expect(page).not_to have_content 'Charmander: 100HP'
    expect(page).to have_content 'Charmander: 90HP'
  end





end
