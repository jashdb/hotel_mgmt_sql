import PySimpleGUI as sg
from query_execute import result_query

def get_data():
    query = "SELECT * FROM View_KhachHang_PhieuThue"
    return result_query(query).fetchall()

def create_layout():
    data = get_data()
    table_data = [list(row) for row in data]

    layout = [
        [sg.Text('Thông tin Khách Hàng cùng Phiếu thuê', size=(1280, 1), justification='center', font=('Helvetica', 24, 'bold'))],
        [sg.Column(layout=[[sg.Table(values = table_data,headings=['Mã KH', 'Tên KH', 'Địa chỉ', 'Điện thoại', 'Quốc tịch', 'Mã PT', 'Ngày lập phiếu', 'Ngày thuê phòng', 'Ngày hẹn trả', 'Trạng thái', 'Tiền đặt cọc', 'Yêu cầu'], display_row_numbers=False, justification="center", auto_size_columns=False, enable_events=True, selected_row_colors='red on yellow', font=('Arial', 12), key = "table", size = (800, 50))]], 
                   size=(800, 600), justification="center", scrollable=True)]
    ]

    return layout

layout = create_layout()
window = sg.Window('View_KhachHang_PhieuThue', layout, size=(1280,720))

while True:
    event, values = window.read()

    if event == sg.WIN_CLOSED:
        break

window.close()