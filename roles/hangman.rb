name 'hangman'
description 'Sets up and deploys the hangman demo.'
run_list(
    'recipe[yum]',
    'recipe[apache2]',
    'recipe[tomcat]',
    'recipe[hangman]'
)

