import PySimpleGUI as sg
from query_execute import result_query

def create_layout():
    layout = [
        [sg.Text('Tạo Phiếu thuê', justification='center', font=('Helvetica', 18, 'bold'))],
        [sg.Text('Mã Phiếu thuê: '), sg.InputText(default_text="PTnnn", size=(30,1), key = 'id_PT')],
        [sg.Text('Mã KH: '), sg.InputText(size=(30,1), key = 'id_KH')],
        [sg.Text('Đặt Phòng: '), sg.Multiline(size=(30,5), key='room_list'), sg.Button(button_text="Add", size=(5,2), key = 'add'), sg.Button(button_text="Delete", size=(5,2), key = 'del')],
        [sg.Text('Ngày thuê phòng (YY-MM-DD HH:MM:SS): '), sg.InputText(size=(17,1),key = 'book_dt')],
        [sg.Text('Ngày hẹn trả (YY-MM-DD HH:MM:SS): '), sg.InputText(size=(17,1),key = 'pay_dt')],
        [sg.Text('Tiền đặt cọc: '), sg.InputText(size=(9,1), key = 'money')],
        [sg.Text('Yêu cầu: '), sg.InputText(size = (100,1), key = 'request')]
    ]

    return layout

layout = create_layout()
window = sg.Window("Tạo phiếu thuê", layout)

while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED:
        break

window.close()