feature 'Players can add names' do
  scenario 'Players add their names' do
    visit('/')
    fill_in('player_1_name', with: 'Adam')
    fill_in('player_2_name', with: 'Ana')
    click_button('submit')
    expect(page).to have_content('Player 1: Adam Player 2: Ana')
  end
end