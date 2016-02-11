import QtQuick 1.1
Rectangle {
    id: loginPg
    signal loginAccepted // сигнал об успешном логине и пароле
    width: 100
    height: 62
    Image{
        id: image
        source: "qrc:/background.jpg"
        anchors.fill: parent
        fillMode: Image.Stretch
    }
    Rectangle {
        id: login //Имя строки ввода

        width: 200
        height: 27

        x: parent.width / 2 - width/2;
        y: parent.height / 2 - height/2;

        //Размеры строки ввода


        //цвет строки ввода
        color: "gray"

        TextInput {
            id: text1
            objectName: "textinput"
            color: "#151515";
            selectionColor: "gray"
            font.pixelSize: 12;
            width: parent.width-4
            anchors.centerIn: parent
            focus: true
            }
        Text{
            x:5
            y:parent.height/2 - 10
            text: "Login"
            color: "white"
            font.pointSize: 16
            visible: text1.text ? false : true;
        }
    }
    Rectangle {
                id: password //Имя строки ввода

                width: 173
                height: 27

                //Размещаем ниже
                x: parent.width / 2 - width/2 * 1.16;
                y: parent.height / 2 - height/2 + 35;

                //Размеры строки ввода


                //цвет строки ввода
                color: "gray"

                TextInput {
                    id: text2
                    objectName: "textinput"
                    color: "#151515";
                    selectionColor: "gray"
                    font.pixelSize: 12;
                    width: parent.width-4
                    anchors.centerIn: parent
                    focus: true
                    }
                Text{
                    x:5
                    y:parent.height/2 - 10
                    text: "Password"
                    color: "white"
                    visible: text2.text ? false : true;
                }
            }
    Button
    {
        id: button //Имя кнопки

                width: 27
                height: 27

                //Размещаем в центре
                x: parent.width / 2 - 173/2 * 1.16 + 173;
                y: parent.height / 2 - height/2 + 35;

                //Размеры кнопки


                //Цвет кнопки
                color: "grey"

                //Текст кнопки
                Image{
                    id: image1
                    source: "qrc:/right.png"
                    anchors.fill: parent
                    fillMode: Image.Stretch
                }
        onClicked:
        {
            console.log("clicked") // вывод отладочной информации
            if (text1.text == "login" && text2.text == "password")
            {
                console.log("login accepted") // вывод отладочной информации
                loginPg.loginAccepted()  // собственно вызываем сигнал что login и password верные
            }
        }
    }
}
