// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0
Rectangle {
    id: button
    signal clicked // этот сигнал вызывается ниже при нажании в MouseArea
    MouseArea
    {
        id: mArea
        anchors.fill: parent
        onClicked: button.clicked() // собственно тут мы и вызываем сигнал clicked
    }
}
