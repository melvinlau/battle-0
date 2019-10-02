feature "view player 2's Hit Points (HP)" do

  scenario 'see Player 2 HP' do
    sign_in_and_play
    expect(page).to have_content("Squirtle: 100HP")
  end

end