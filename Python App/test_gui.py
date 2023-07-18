import PySimpleGUI as sg

data = [[f"Row {i}", f"Data {i}"] for i in range(1, 11)]
header = ['Column 1', 'Column 2']

# Create the layout with a column element to center the table
layout = [
    [sg.Text('Table Centered in Window', justification='center')],
    [sg.Column(layout=[[sg.Table(values=data, headings=header, display_row_numbers=False,
                                 auto_size_columns=False,
                                 num_rows=min(25, len(data)))]],
               justification='center')],
    [sg.Button('Exit')]
]

window = sg.Window('Centered Table', layout, finalize=True)

while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED or event == 'Exit':
        break

window.close()