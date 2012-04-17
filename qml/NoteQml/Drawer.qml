// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: drawer
    signal clicked
    height: parent.height; width: 15
    border { color : "#6A6D6A"; width: 1 }
    z: 1
    radius: 5
    gradient: Gradient {
            GradientStop { position: 0.0; color: "#8C8F8C" }
            GradientStop { position: 0.17; color: "#6A6D6A" }
            GradientStop { position: 0.77; color: "#3F3F3F" }
            GradientStop { position: 1.0; color: "#6A6D6A" }
        }

    MouseArea {
        id: drawerMouseArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: parent.border.color = Qt.lighter("#6A6D6A")
        onExited:  parent.border.color = "#6A6D6A"
        onClicked: {
            drawer.clicked()

        }
    }
}
