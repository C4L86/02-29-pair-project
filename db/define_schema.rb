require_relative "./_configure"

DB.define_table("games")
DB.define_column("games", "title", "string")
DB.define_column("games", "genre", "string")
DB.define_column("games", "age_group", "integer")
DB.define_column("games", "min_players", "integer")
DB.define_column("games", "max_players", "integer")
DB.define_column("games", "play_time", "integer")
DB.define_column("games", "description", "string")
DB.define_column("games", "publisher", "string")
DB.define_column("games", "price", "float")

# DB.define_table("users")
# DB.define_column("users", "name", "string")
# DB.define_column("users", "email", "string")
# DB.define_column("users", "password", "string")