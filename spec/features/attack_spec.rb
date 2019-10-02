feature "Attack" do

  scenario 'attack player and get confirmation' do
    sign_in_and_play
    click_button("Attack")
    click_button('OK')
    expect(page).not_to have_content 'Squirtle: 100HP'
    expect(page).to have_content 'Squirtle: 90HP'
  end

end