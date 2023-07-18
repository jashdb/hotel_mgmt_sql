# hotel_mgmt_sql
A SQL Server database project has a UI created by Python.
- We're using pyodbc library to set up the connection of the database to our Python project. 
- Retrieve the server name by this line: SELECT @@SERVERNAME
- Use this code to set up the connection:
  import pyodbc 

  conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=server_name;'
                      'Database=database_name;'
                      'Trusted_Connection=yes;')

- Execute query:
  cursor = conn.cursor()
  cursor.execute('SELECT * FROM table_name')
- If you want to store the result of queries in dataFrames, use this: df = pd.read_sql(query, conn). Install SQLAlchemy if necessary
- The UI is created by the PySimpleGUI library.
- There are some functions that we want to implement in the future. But due to the urgency of the project, we can not do it all
- Feel free to use and share. Happy coding!
