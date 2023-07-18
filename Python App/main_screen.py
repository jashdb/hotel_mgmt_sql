import PySimpleGUI as sg
from query_execute import result_query
from crud_employee import employee_screen
from hotel_rooms import rooms_screen
from crud_customer import customer_screen
from book_and_pay import book_and_pay_screen
pad_amount = (15, 5)

layout = [
[sg.Text("Phần mềm Quản lý Khách sạn Hoa Thanh Việt", size=(1280, 3), justification='center', font=('Helvetica', 30, 'bold'))],
[sg.Text("Các chức năng hệ thống", size=(1280, 1), justification='center', text_color="Black", background_color='#a0e9fa', font=('Helvetica', 24, 'bold'))],   
[sg.Button(button_text="Khách hàng", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=pad_amount, key="CRUD_KH", tooltip="Quản lý thông tin khách hàng"),
 sg.Button(button_text="Phòng Khách sạn", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=pad_amount, key="CRUD_PKS", tooltip="Quản lý thông tin phòng khách sạn"),
 sg.Button(button_text="Nhân viên", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=pad_amount, key="CRUD_NV", tooltip="Quản lý thông tin nhân viên"),
 sg.Button(button_text="Thuê, trả phòng", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=pad_amount, key="B&P", tooltip="Quản lý thuê trả phòng")],
[sg.Text("Chức năng báo cáo, thống kê", size=(1280, 1), justification='center', text_color="Black", background_color='#a0e9fa', font=('Helvetica', 24, 'bold'))],
[sg.Button(button_text="Báo cáo Thống kê", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=pad_amount*5, key="BCTK", tooltip="Báo cáo thống kê")]
]

window = sg.Window('Phần mềm Quản lý Khách sạn Hoa Thanh Việt', layout, size=(1280, 720))
while True:
    event, values = window.read()

    if event == sg.WIN_CLOSED:
        break
    
    if event == "CRUD_NV":
        employee_screen()
    if event == "CRUD_PKS":
        rooms_screen()
    if event == "CRUD_KH":
        customer_screen()
    if event == "B&P":
        book_and_pay_screen()
    
window.close()