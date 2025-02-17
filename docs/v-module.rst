V Module
========

Install or update to the latest with:

.. code-block:: sh

   v install elliotchance.vsql

.. code-block:: v

   import elliotchance.vsql.vsql

   fn example() ? {
     mut db := vsql.open('test.vsql') ?

     // All SQL commands use query():
     db.query('CREATE TABLE foo (x DOUBLE PRECISION)') ?
     db.query('INSERT INTO foo (x) VALUES (1.23)') ?
     db.query('INSERT INTO foo (x) VALUES (4.56)') ?

     // Iterate through a result:
     result := db.query('SELECT * FROM foo') ?
     println(result.columns)

     for row in result {
         println(row.get_f64('X') ?)
     }

     // See SQLSTATE (Errors) below for more examples.
   }

Outputs:

.. code-block:: text

   ['A']
   1.23
   4.56

You can find the documentation for a
`Row here <https://github.com/elliotchance/vsql/blob/main/vsql/row.v>`_.
