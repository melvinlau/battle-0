feature 'switch turns' do
  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content("Charmander's turn")
    end

  scenario 'after a player has been attacked' do
    sign_in_and_play
    click_button("Attack")
    click_button('OK')
    expect(page).to have_content("Squirtle's turn")
    expect(page).not_to have_content("Charmander's turn")
  end

end
end