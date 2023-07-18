import pyodbc 
import PySimpleGUI as sg

#connect to our database server
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-KJNF2QE;'
                      'Database=hotel_management;'
                      'Trusted_Connection=yes;')
cursor = conn.cursor()

window_width = 1000
window_height = 800
 
#Define the layout of our window
layout = [
    [sg.Text("Welcome to Your Hotel Management Query Display!")],
    [sg.Text("Please enter a query:")],
    [sg.InputText(size = (100,1),key="-QUERY-")],
    [sg.Button("Submit")],
    [sg.Multiline(size=(100, 10), key="-OUTPUT-", autoscroll=True)]
]

# Create the window
window = sg.Window("Hotel Management", layout, size = (window_width, window_height))

# Event loop to process events and interact with elements
while True:
    event, values = window.read()
    
    # Display the query result under the submit button
    if event == "Submit":
        try:
            query = values["-QUERY-"]
            cursor.execute(query)

            # Generate the output message after query
            result_as_strings = ""
            for row in cursor:
                string = [str(item) for item in row]
                row_string = '\t'.join(string)  # Using '\t' as a separator between columns
                result_as_strings += row_string + '\n'

            output_message = result_as_strings
        
        except pyodbc.Error as e:
            output_message = "Error: You entered a wrong query.\nError Details: " + str(e)
        # Update the multiline text element to display the results
        window["-OUTPUT-"].update(output_message)
        
    # End the program only if the window is closed
    if event == sg.WIN_CLOSED:
        break

# Close the window and end the program
window.close()