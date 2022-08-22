# Artist Model and Repository Classes Design Recipe

1. Design and create the Table

```
# EXAMPLE

Table: artists

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

TRUNCATE TABLE artists RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('David', 'April 2022');
INSERT INTO artists (name, genre) VALUES ('Anna', 'May 2022');
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your*database_name < seeds*{table_name}.sql 3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.
```

```RUBY
# EXAMPLE

# Table name: artists

# Model class

# (in lib/Artist.rb)

class Artist
end

# Repository class

# (in lib/Artist_repository.rb)

class ArtistRepository
end
```

4. Implement the Model class

```

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```

```RUBY

# EXAMPLE

class Artist
attr_accessor :id, :name, :genre
end


```

5. Define the Repository Class interface

```

   Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

  Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```

```RUBY
# EXAMPLE
class ArtistRepository

# Selecting all records
def all 
# Executes the SQL query: # SELECT id, name, genre FROM artists; # Returns an array of Artist objects.
end

# Gets a single record by its ID
def find(id) 
# Executes the SQL query: # SELECT id, name, genre FROM artists WHERE id = $1;
# Returns a single Artist object.
end

# Add more methods below for each operation you'd like to implement.

def create(artist)
repo = ArtistRepository.new
artist = Artist.new
arist.name = "Lixies"
artist.genre = "Lop"

repo.create(artist)
artists = repo.all

added_artist = artists.last
added_artist.name  # Lixies
added_artist.genre # Lop

end

# delete by artist id
def delete(artist)
   repo = ArtistRepository.new

   the_artist = repo.find(1)

   repo.delete(the_artist.id)
   all_artists = repo.all
   all_artists.length # 1
   all_artists.first.id # 2
end

def update(artist)
   repo = ArtistRepository.new

   artist = repo.find(1)

   artist.name = "Jakie Chan"
   artist.genre = "Idk"

   new_artist = repo.find(1)

   new_artist.name # "Jakie Chan"
   new_artist.genre # "Idk"

end
```

6. Write Test Examples

```
   Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

  These examples will later be encoded as RSpec tests.
```

```RUBY
# EXAMPLES

# 1

# Get all artists

repo = ArtistRepository.new

artists = repo.all
artists.length # 2
artists.first.id # 1
artists.first.name # Pixies


# 2

# Get a single Artist

repo = ArtistRepository.new

artist = repo.find(1)
artist.id # => 1
artist.name # => 'Rox'
artist.genre # => 'Pop'

# Add more examples for each method

Encode this example as a test.
```

7. Reload the SQL seeds before each test run

```
   Running the SQL code present in the seed file will empty the table and re-insert the seed data.

   This is so you get a fresh table contents every time you run the test suite.
```

```RUBY
# EXAMPLE

# file: spec/Artist_repository_spec.rb

def reset_artists_table
seed_sql = File.read('spec/seeds_artists.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'artists' })
connection.exec(seed_sql)
end

describe ArtistRepository do
before(:each) do
reset_artists_table
end

# (your tests will go here).

end

```

8. Test-drive and implement the Repository class behaviour

```

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

```

```

```
