import PySimpleGUI as sg
from query_execute import result_query

def display_room_info(room_number):
    def get_a_room_data(room_number):
        query = f"SELECT LoaiPhong, KieuPhong, Dientich, Dongia  FROM LoaiPhong where LoaiPhong = (select LoaiPhong from PhongKS where MaPhong = {room_number})"
        return result_query(query).fetchall()[0]

    def get_all_rooms_number():
        query = "Select MaPhong From PhongKS"
        tuple_data = result_query(query).fetchall()
        list_data = []
        for item in tuple_data:
            list_data.append(item[0])
        return list_data
    
    def get_output_msg(room_number):
        room_info = get_a_room_data(room_number)
        output_msg = f'Mã phòng: {room_number}\nLoại phòng: {room_info[0]}\nKiểu phòng: {room_info[1]}\nDiện tích (m2): {room_info[2]}\nĐơn giá (VND/ngày): {room_info[3]}'
        return output_msg
    
    def create_room_info_layout():
        layout = [
            [sg.Text('Thông tin chi tiết Phòng', size=(1280, 1), justification='center', font=('Helvetica', 24, 'bold'))],
            [sg.Text('Chọn xem phòng:'), sg.Combo(get_all_rooms_number(), default_value=room_number, readonly=True,size=(10,1), key = "select-room-number"), sg.Button("Choose", key = "submit")],
            [sg.Multiline(default_text=get_output_msg(room_number), size=(100, 10), font=('Arial', 18) , key="-OUTPUT-", autoscroll=True)],
            [sg.Button("Back", key = "back", size = (5,2))]
        ]

        return layout

    window = sg.Window('Thông tin chi tiết Phòng', create_room_info_layout(), size=(1280, 720), finalize=True)

    while True:
        event, values = window.read()

        if event == sg.WIN_CLOSED or event == "back":
            break

        if event == "submit":
            room_number = values['select-room-number'] 
            output_msg = get_output_msg(room_number)
            window['-OUTPUT-'].update(output_msg)
            
    window.close()
