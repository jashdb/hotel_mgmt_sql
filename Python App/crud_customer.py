import PySimpleGUI as sg
from query_execute import result_query
from add_customer import add_customer
def customer_screen():

    def get_customers():
        query = "Select * from KhachHang"
        return result_query(query).fetchall()

    def create_cus_layout():

        employ_data = get_customers()
        employ_table_data = [list(row) for row in employ_data]

        layout = [[sg.Text('Thống kê Khách Hàng', size=(1280, 1), justification='center', font=('Helvetica', 24, 'bold'))],
                [sg.Text('Thông tin Khách hàng', size=(1280, 1), justification='center', text_color="Black", background_color='#a0e9fa', font=('Arial', 16, 'bold'))], 
                [sg.Column(layout=[[sg.Table(values = employ_table_data,headings=['Mã KH', 'Tên KH', 'Địa chỉ', 'Điện thoại', 'Quốc tịch', 'Số CMND', 'Số hộ chiếu'], display_row_numbers=False, justification="center", auto_size_columns=False, selected_row_colors='red on yellow', font=('Helvetica', 14))]], justification="center")],
                [sg.Text('Quản lý thông tin Khách hàng', size=(1280, 1), justification='center', text_color="Black", background_color='#a0e9fa', font=('Arial', 16, 'bold'))],
                [sg.Button(button_text="Thêm", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="Add_KH", tooltip="Thêm khách hàng"),
                sg.Button(button_text="Sửa", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="Edit_KH", tooltip="Sửa thông tin khách hàng"),
                sg.Button(button_text="Xóa", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="Del_KH", tooltip="Xóa khách hàng"),
                sg.Button(button_text="Tìm kiếm thêm...", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="Find_KH", tooltip="Tìm kiếm theo thông tin khách hàng")],
                 [sg.Button(button_text="Back", size=(5, 2), font=('Helvetica', 14), key="back")]
        ]
        return layout


    layout = create_cus_layout()
    window = sg.Window('Thống kê Khách hàng', layout, size=(1280,720))

    while True:
        event, values = window.read()

        if event == sg.WIN_CLOSED or event == "back":
            break
        if event == "Add_KH":
            add_customer()
            window.close()
            layout = create_cus_layout()
            window = sg.Window('Thống kê Khách hàng', layout, size=(1280,720))

    window.close()
