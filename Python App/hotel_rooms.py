import PySimpleGUI as sg
from query_execute import result_query
from room_info import display_room_info

def rooms_screen():
    # Define the function to fetch room data from the database
    def get_room_data():
        query = "SELECT MaPhong, TinhtrangP FROM PhongKS"
        return result_query(query).fetchall()

    # Function to create the layout of the Hotel Rooms screen
    def create_hotel_rooms_layout():
        room_data = get_room_data()
        rows = 4  # Number of rows in the grid
        cols = 6  # Number of columns in the grid

        # Initialize grid buttons based on room data
        buttons = {}
        for row in room_data:
            room_number = row[0]
            status = row[1]
            row, col = divmod(int(room_number), 100)
            row -= 1  # Adjust row index (0-based)
            col -= 1  # Adjust column index (0-based)

            # Set the color based on the status
            if status == 'Trong':
                color = '#60fc5d'  # Dark green
                tooltip = 'Trống'
            else:
                color = '#fced5d'  # Dark yellow
                tooltip = 'Đã thuê'

            button_text = f'{room_number}'
            buttons[(row, col)] = sg.RButton(button_text, size=(15, 5), font=('Helvetica', 14), button_color=('black', color), pad=(5, 5), key=(row, col), tooltip=tooltip)

        layout = [[sg.Text('Phòng Khách sạn', size=(1280, 1), justification='center', font=('Helvetica', 24, 'bold'))]]

        # Create a grid for the rooms
        grid_layout = []
        for i in range(rows):
            row_buttons = [buttons[(i, j)] for j in range(cols)]
            grid_layout.append(row_buttons)

        layout.append([sg.Column(grid_layout, size=(1280, 400), scrollable=True, pad=(20, 20))])
        layout.append([sg.Button('Thêm', size=(10, 2), key='Add_r'),
                    sg.Button('Sửa', size=(10, 2), key='Edit_r'),
                    sg.Button('Xóa', size=(10, 2), key='Del_r')])
        layout.append([sg.Button('Back', size=(10, 2), key='back')])

        return layout

    # Create the window and buttons
    layout = create_hotel_rooms_layout()
    window = sg.Window('Quản lý Phòng Khách sạn', layout, size=(1280, 720))

    # Event loop to handle user interaction
    while True:
        event, values = window.read()

        if event in (sg.WIN_CLOSED, 'back') or event == sg.WIN_CLOSED:
            break

        # Handle room button clicks
        if isinstance(event, tuple):
            room_number = (event[0] +1) * 100 + event[1] + 1
            display_room_info(room_number)
    # Close the window and the connection
    window.close()
