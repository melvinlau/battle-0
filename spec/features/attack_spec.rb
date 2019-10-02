feature "Attack" do

  scenario 'attack player and get confirmation' do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Charmander attacked Squirtle")
  end

end