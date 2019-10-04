feature "Poison attack" do
  scenario 'player1 poison player2 shows confirmation page' do
    sign_in_and_play
    click_button("Poison")
    expect(page).to have_content("Charmander used Poison!")
    # click_button("OK")
    # expect(page).to have_content("Squirtle took poison damage!")
  end
end
