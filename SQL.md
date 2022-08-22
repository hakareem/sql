# DATABASES

### <ins>Postgres</ins>

<ins>RELATIONAL</ins>

<li>
Organises data in tables made with columns and rows.
</li>
<li>
Columns = categories
</li>
<li>
Rows = holds data entry 
</li>
<li>
  Talk to the database using SQL (Structured, Query, Language)
</li>
<li>
  Arrange the pattern of rows, columns and tables using a schema. 
</li>

<br>
</br>
</br>
</br>

---

### <ins> PSQL Cheatsheet </ins>

</br>
<div>

# Install PSQL
 <li>
     brew install postgresql 
  </li>

 <li>
    brew services start postgresql 
  </li>


# Run SQL

  <li>
   psql -h 127.0.0.1 {database_name}
  </li>

#### How to list all databases

<ul>
  <li>
    \l
  </li>
</ul>

#### How to create a database

<ul>
  <li>
   CREATE DATABASE bookmark_manager;
  </li>
</ul>

#### How to change from one database to another || show tables contents

<ul>
  <li>
    \c bookmark_manager;
  </li>
</ul>

#### How to inspect existing list of a table

<ul>
  <li>
     \dt
  </li>
</ul>

<br>

## CRUD --- create, read, update, delete

<br>

#### How to view all contents in a table

<ul>
  <li>
    SELECT * FROM bookmarks;
  </li>
</ul>

#### Manual ID ( insert data table)

<ul>
  <li>
    INSERT INTO bookmarks(props) VALUES(1, 'one');
  </li>
</ul>

#### Automatic ID ( insert data table)

<ul>
  <li>
   INSERT INTO bookmarks (url) VALUES ('one');
  </li>
</ul>

#### Delete Data

<ul>
  <li>
    DELETE FROM bookmarks WHERE id = '1';
  </li>
</ul>

#### Update data

<ul>
  <li>
    UPDATE bookmarks SET release_year = '1994' WHERE id = '5';
  </li>
</ul>

#### Inserting data

<ul>
  <li>
   INSERT INTO artists (name, genre) VALUES('Massive Attack', 'Alternative');
  </li>
</ul>

</div>
