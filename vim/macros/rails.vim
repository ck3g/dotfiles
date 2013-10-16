command! -nargs=0 Rroutes :find config/routes.rb

command! -nargs=0 Rschema :find db/schema.rb

command! -nargs=0 Rconfig :find application.yml

Rnavcommand sass public/stylesheets/sass -suffix=.sass
