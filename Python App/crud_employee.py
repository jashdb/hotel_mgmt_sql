import PySimpleGUI as sg
from query_execute import result_query
def employee_screen():

    def get_employees():
        query = "Select * from Nhanvien"
        return result_query(query).fetchall()

    def create_emp_layout():

        employ_data = get_employees()
        employ_table_data = [list(row) for row in employ_data]

        layout = [[sg.Text('Thống kê nhân viên', size=(1280, 1), justification='center', font=('Helvetica', 24, 'bold'))],
                [sg.Text('Thông tin nhân viên', size=(1280, 1), justification='center', text_color="Black", background_color='#a0e9fa', font=('Arial', 16, 'bold'))], 
                [sg.Column(layout=[[sg.Table(values = employ_table_data,headings=['Mã NV', 'Tên NV', 'Điện thoại', 'Mô tả khác'], display_row_numbers=False, justification="center", auto_size_columns=False, selected_row_colors='red on yellow', font=('Helvetica', 14))]], justification="center")],
                [sg.Text('Quản lý nhân viên', size=(1280, 1), justification='center', text_color="Black", background_color='#a0e9fa', font=('Arial', 16, 'bold'))],
                [sg.Button(button_text="Thêm", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="Add_NV", tooltip="Thêm nhân viên"),
                sg.Button(button_text="Sửa", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="Edit_NV", tooltip="Sửa thông tin nhân viên"),
                sg.Button(button_text="Xóa", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="Del_NV", tooltip="Xóa nhân viên"),
                sg.Button(button_text="Thống kê công việc", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="Work_NV", tooltip="Xem số phiếu thuê mà mỗi nhân viên đã xử lý")],
                 [sg.Button(button_text="Back", size=(5, 2), font=('Helvetica', 14), key="back")]
        ]
        return layout


    layout = create_emp_layout()
    window = sg.Window('Thống kê nhân viên', layout, size=(1280,720))

    while True:
        event, values = window.read()

        if event == sg.WIN_CLOSED or event == "back":
            break

    window.close()
