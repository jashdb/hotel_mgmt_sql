import PySimpleGUI as sg

def book_and_pay_screen():
    def create_layout():
        layout = [
            [sg.Text("Thuê trả phòng", size=(1280, 3), justification='center', font=('Helvetica', 24, 'bold'))],
            [sg.Text("Quản lý phiếu thuê", size=(1280, 1), justification='center', text_color="Black", background_color='#a0e9fa', font=('Helvetica', 24, 'bold'))],
            [sg.Button(button_text="Tạo mới", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="add_PT", tooltip="Lập một phiếu thuê mới cho khách hàng"),
            sg.Button(button_text="Hủy phiếu thuê", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="cancel_PT", tooltip="Hủy một phiếu thuê đang trong trạng thái thuê")],
            [sg.Text("Quản lý hóa đơn thanh toán", size=(1280, 1), justification='center', text_color="Black", background_color='#a0e9fa', font=('Helvetica', 24, 'bold'))],
            [sg.Button(button_text="Tạo mới", size=(20, 5), font=('Helvetica', 18), button_color=('black', 'white'), pad=(15,5), key="add_PT", tooltip="Lập một hóa đơn sau khi khách hàng thanh toán thành công")],
            [sg.Button(button_text="Back", size=(5, 2), key="back")]
        ]

        return layout

    layout = create_layout()
    window = sg.Window('Quản lý Thuê trả Phòng', layout, size=(1280, 720))

    while True:
        event, values = window.read()

        if event == sg.WIN_CLOSED or event == "back":
            break
    window.close()   

