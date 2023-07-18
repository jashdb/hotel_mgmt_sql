import PySimpleGUI as sg
from db_connector import connection

def add_customer():
    def create_layout():
            layout = [[sg.Text('Thêm Khách Hàng', justification='center', font=('Helvetica', 18, 'bold'))],
                  [sg.Text('Mã KH'), sg.InputText(default_text="KHnnn", size=(30,1), key = 'id')],
                        [sg.Text('Tên Khách Hàng'), sg.InputText(default_text="Name", size=(30,1), key = 'name')],
                    [sg.Text('Địa chỉ'), sg.InputText( size=(50,1), key = 'address')],
                    [sg.Text('Quốc tịch'), sg.InputText( size=(30,1), key = 'country')],
                    [sg.Text('Điện thoại'), sg.InputText( size=(30,1), key = 'phone_number')],
                    [sg.Text('Số CMND'), sg.InputText( size=(30,1), key = 'cmnd')],
                    [sg.Text('Số hộ chiếu'), sg.InputText( size=(30,1), key = 'passport')],
                    [sg.Button('Submit', size=(5,2), key = 'submit')],
                    [sg.Button('Back', size=(5,2), key = 'back')]]
            
            return layout
    layout = create_layout()
    window = sg.Window('Thêm khách hàng', layout, finalize=True)

    while True:
            event, values = window.read()
            if event == sg.WIN_CLOSED or event == 'back':
                break
            if event == 'submit':
                id = values['id']
                name = values['name']
                address_unformat = values['address']
                address = f'\'{address_unformat}\'' if address_unformat else 'NULL'
                country_unformat = values['country']
                country = f'\'{country_unformat}\'' if country_unformat  else 'NULL'
                phone = int(values['phone_number']) if values['phone_number'] else 'NULL'
                cmnd = int(values['cmnd']) if values['cmnd']  else 'NULL'
                passport = int(values['passport']) if values['passport'] else 'NULL'
                query = f'insert into KhachHang values (\'{id}\',\'{name}\',{address},{phone},{country},{cmnd},{passport});'
                conn = connection()
                conn.cursor().execute(query)
                conn.commit()
                break

    window.close()