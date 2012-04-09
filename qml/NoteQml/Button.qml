import QtQuick 1.0

Rectangle {
    id:button
    property alias text: textItem.text

    signal clicked

    width: 100; height: 50
    border.width: 1
    radius: 5
    smooth: true

    gradient: Gradient {
        GradientStop { position: 0.0; color: "darkGray" }
        GradientStop { position: 0.5; color: "black" }
        GradientStop { position: 1.0; color: "darkGray" }
    }

    Text {
        id: textItem
        anchors.centerIn: parent
        font.pointSize: 15
        color: "White"
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
//            doOp(operation)
            button.clicked()
    }
    }
}
