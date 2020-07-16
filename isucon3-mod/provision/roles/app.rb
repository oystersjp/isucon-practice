# User
include_recipe "../cookbooks/isucon-user"

# Nginx
include_recipe "../cookbooks/nginx"

# MySQL
include_recipe "../cookbooks/mysql"

# Golang
include_recipe "../cookbooks/golang"

# Application
include_recipe "../cookbooks/application"

# Benchmarker
include_recipe "../cookbooks/bench"

# netdata
include_recipe "../cookbooks/netdata"

# kataribe
include_recipe "../cookbooks/kataribe"
