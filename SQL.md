# DATABASES

### <ins>There 2 different types of DBMS</ins>

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
Very structured and strict with data types
</li>
<li>
Making it great for managing complex datasets.  
</li>
<li>
You talk to the database using SQL (Structured, Query, Language)
</li>
<li>
You arrange the pattern of rows, columns and tables using a schema. 
</li>

<br>
<ins>NON-RELATIONA: ‘NoSQL’</ins>

<br>
<li>
Doesn’t use SQL to communicate. 
</li>
<li>
More flexible, not as strict with data types
</li>
<li>
Good for getting a database up and running quickly because you don’t have to create a schema ( which is usually strict) before adding data.
</li>
<li>
It’s also good for deploying data across decentralised distribution networks (data stored across different computers that all have coordinates with each other)
</li>

</br>
</br>
</br>

---

### <ins> PSQL Cheatsheet </ins>

</br>
<div>

# Install PSQL

<h1> brew install postgresql </h1>
<h2> brew services start postgresql </h2>

# Run SQL

  <li>
   psql -h 127.0.0.1 {database_name}
  </li>

#### How to list all databases

<ul>
  <li>
    postgres=#   \l
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
    INSERT INTO bookmarks VALUES(1, 'one');
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
