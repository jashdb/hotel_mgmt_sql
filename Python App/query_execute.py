import pyodbc

def result_query(query):
    # change the connection info to your local ones; if you also use sql server, get your server name by 'SELECT @@SERVERNAME'
    connection_info = ('Driver={SQL Server};' 
                    'Server=DESKTOP-KJNF2QE;'
                    'Database=hotel_management;'
                    'Trusted_Connection=yes;')
    
    conn = pyodbc.connect(connection_info)
    cursor = conn.cursor()
    cursor.execute(query)
    return cursor

