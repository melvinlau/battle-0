feature "Poison attack" do
  before(:each) do
    allow_any_instance_of(Object).to receive(:rand) { 2 }
  end
  scenario 'player1 poison player2 shows confirmation page' do
    sign_in_and_play
    click_button("Poison")
    expect(page).to have_content("Charmander used Poison!")
  end

  scenario "player2 starts turn with confirmation they have been poisoned" do
    sign_in_and_play
    click_button("Poison")
    click_button("OK")
    expect(page).to have_content("Squirtle took poison damage!")
  end
end
