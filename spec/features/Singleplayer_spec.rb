feature 'singleplayer' do
  scenario 'select singleplayer from home page' do
    visit '/'
    click_button "Single Player"
    expect(page).to have_content("Enter your name:")
  end

  scenario 'enter name and submit' do
    single_player_sign_in_and_play
    expect(page).to have_content("Billy VS. Compy")
  end

  context 'when player turn' do
    before :each do
      single_player_sign_in_and_play
    end
    scenario 'computer turn button not displayed' do
      expect(page).not_to have_button("Compy's Turn")
    end
  end
  
  context 'when computer turn' do
    before :each do
      single_player_sign_in_and_play
      current_player_attacks
      allow_any_instance_of(Object).to receive(:rand) { 5 }
    end

    scenario 'computer uses attack' do
      click_button("Compy's Turn")
      expect(page).to have_content("Compy attacked Billy")
    end

    scenario 'computer attack reduces player HP' do
      computer_attacks
      expect(page).to have_content("Billy: 90HP")
    end

    scenario 'computer attack reduces player HP' do
      expect(page).not_to have_button("Attack")
      expect(page).not_to have_button("Poison")
    end
  end
end