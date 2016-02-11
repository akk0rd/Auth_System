import QtQuick 1.1
Rectangle {
    width: 600
    height: 400
    Image{
        id: image
        source: "qrc:/background.jpg"
        anchors.fill: parent
        fillMode: Image.Stretch
    }
    Register { // добавляем наше окно
        id: loginWindow
        anchors.fill: parent // растягиваем его на всё окно
        onLoginAccepted:
        {
            loginWindow.visible = false // прячем окно логина
            secrText.visible = true // и показываем окно с текстом
        }
    }
    Text
    {
        id: secrText // id, по которому мы обращаемся к тексту
        visible: false // изначально наш текст не виден
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: "Секретный текст" // выводим текст
    }
}
