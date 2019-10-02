feature 'Players can add names' do
  scenario 'Players add their names' do
    sign_in_and_play
    expect(page).to have_content('Charmander VS. Squirtle')
  end
end