# Album Model and Repository Classes Design Recipe

1. Design and create the Table

```
# EXAMPLE

Table: Albums

Columns:
id | name | genre 2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds\_{table_name}.sql)

-- Write your SQL seed here.

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE Albums RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO Albums (name, genre) VALUES ('David', 'April 2022');
INSERT INTO Albums (name, genre) VALUES ('Anna', 'May 2022');
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your*database_name < seeds*{table_name}.sql 3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.
```

```RUBY
# EXAMPLE

# Table name: Albums

# Model class

# (in lib/Album.rb)

class Album
end

# Repository class

# (in lib/Album_repository.rb)

class AlbumRepository
end
```

4. Implement the Model class

```

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```

```RUBY

# EXAMPLE

# Table name: Albums

# Model class

# (in lib/Album.rb)

class Album

# Replace the attributes by your own columns.

attr_accessor :id, :name, :genre
end

# The keyword attr_accessor is a special Ruby feature

# which allows us to set and get attributes on an object,

# here's an example:

#

# Album = Album.new

# Album.name = 'Jo'

# Album.name

# You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

```

5. Define the Repository Class interface

```

   Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

  Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```

```RUBY
# EXAMPLE

# Table name: Albums

# Repository class

# (in lib/Album_repository.rb)

class AlbumRepository

# Selecting all records

def all # Executes the SQL query: # SELECT id, name, genre FROM Albums; # Returns an array of Album objects.

end


# Gets a single record by its ID
def find(id) # Executes the SQL query: # SELECT id, name, genre FROM Albums WHERE id = $1;
    # Returns a single Album object.
end

# Add more methods below for each operation you'd like to implement.

def create(Album)

end

def update(Album)

end

def delete(Album)

end

```

6. Write Test Examples

```
   Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

  These examples will later be encoded as RSpec tests.
```

```RUBY
# EXAMPLES

  # returns list of artists
  repo = AlbumRepository.new
  albums = repo.all
  albums.length # 2
  albums.first.title # "Fly" 
  albums.first.release_year # 1992
  albums.first.artist_id # "1" 

  # creates a new album record 
  repo = AlbumRepository.new
  album = Album.new
  album.title = "Lixies"
  album.release_year = "1995"
  album.artist_id = "7"

  repo.create(album)
  albums = repo.all

  added_album = albums.last
  added_album.title  # Lixies
  added_album.release_year # 1995
  added_album.artist_id # 7

 #
   

```

7. Reload the SQL seeds before each test run

```
   Running the SQL code present in the seed file will empty the table and re-insert the seed data.

   This is so you get a fresh table contents every time you run the test suite.
```

```RUBY
# EXAMPLE

# file: spec/Album_repository_spec.rb

def reset_Albums_table
seed_sql = File.read('spec/seeds_Albums.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'Albums' })
connection.exec(seed_sql)
end

describe AlbumRepository do
before(:each) do
reset_Albums_table
end

# (your tests will go here).

end

```

8. Test-drive and implement the Repository class behaviour

```

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

```


