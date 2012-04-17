// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle{
    id: rectangle1
    width: 600
    height: 400
    state: "main"
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#28282f";
        }
        GradientStop {
            position: 0.99;
            color: "#c8c8c8";
        }
    }


    Column {
        id: column1
        x: 0
        y: 0
        width: 2*rectangle1.width/3
        height: rectangle1.height


        Rectangle {
            id: rectangle3
            x: 0
            y: 0
            width: column1.width-60
            height: column1.height
            visible: true
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#28282f";
                }
                GradientStop {
                    position: 0.99;
                    color: "#c8c8c8";
                }
            }

            Row {
                id: row1
                x: 0
                y: 0
                width: rectangle3.width
                height: rectangle3.height/5

                Text {
                    id: text2
                    x: row1.width/7
                    y: row1.height/2
                    text: qsTr("Enter date:")
                    font.pixelSize: 12
                }

                Rectangle {
                    id: rectangle4
                    x: 2*row1.width/6
                    y: row1.height/2
                    width: 100
                    height: 20
                    color: "#ffffff"

                    TextEdit {
                        id: text_edit2
                        x: 0
                        y: 0
                        width: rectangle4.width
                        height: rectangle4.height
                        font.pixelSize: 15
                    }
                }
            }

            Row {
                id: row2
                x: 0
                y: rectangle3.height/5
                width: rectangle3.width
                height: 3*rectangle3.height/5


                Rectangle {
                    id: rectangle6

                    width: row2.width
                    height: row2.height
                    color: "#ffffff"

                    TextEdit {
                        id: text_edit4
                        x: 0
                        y: 0
                        width: rectangle6.width
                        height: rectangle6.height
                        font.pixelSize: 15
                    }
                }
            }

            Row {
                id: row3
                x: 0
                y: 4*rectangle3.height/5
                width: rectangle3.width
                height: rectangle3.height/5

                Button {
                    id: addnote
                    anchors.centerIn: parent
                    text: "Add note"
                    onClicked: {
                    }
                }
            }

        }

        Drawer{
            id: showScreen
            Image {
                id: arrowIcon_show
                source: "./images/arrow.png"

                anchors.verticalCenter: parent.verticalCenter
                Behavior{ NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
            }
            x: 48
            y: 0
            onClicked:{
                rectangle1.state="show"
            }
        }

        Drawer{
            id: addScreen
            Image {
                id: arrowIcon_add
                source: "./images/arrow.png"

                anchors.verticalCenter: parent.verticalCenter
                Behavior{ NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
            }
            x: 32
            y: 0
            onClicked:{
                rectangle1.state="add"
            }
        }

        Drawer{
            id: updateScreen
            Image {
                id: arrowIcon_update
                source: "./images/arrow.png"

                anchors.verticalCenter: parent.verticalCenter
                Behavior{ NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
            }
            x: 16
            y: 0
            onClicked:{
                rectangle1.state="update"
            }
        }

        Drawer{
            id: delScreen
            Image {
                id: arrowIcon_del
                source: "./images/arrow.png"

                anchors.verticalCenter: parent.verticalCenter
                Behavior{ NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
            }
            x: 0
            y: 0
            onClicked:{
                rectangle1.state="del"
            }
        }

        Rectangle {
            id: rectangle5
            x: 64
            y: 0
            width: column1.width-64
            height: column1.height
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#28282f";
                }
                GradientStop {
                    position: 0.99;
                    color: "#c8c8c8";
                }
        }
            Text {
                id: textWelcom
                anchors.centerIn: parent
                text: qsTr("Welcom!!!")
                font.pixelSize: 48
                color: "white"
                font.bold: true
            }
        }

        Rectangle {
            id: rectangle7
            x: 0
            y: 0
            width: column1.width-64
            height: column1.height
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#28282f";
                }
                GradientStop {
                    position: 0.99;
                    color: "#c8c8c8";
                }
            }
            Button{
                id: buttonDelByDate
                width: 180
                anchors.centerIn: parent
                text:"Dalete by date"
                onClicked: {

                    }
            }

        }

        Rectangle {
            id: rectangle8
            x: 16
            y: 0
            width: column1.width-64
            height: column1.height
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#28282f";
                }
                GradientStop {
                    position: 0.99;
                    color: "#c8c8c8";
                }
            }

            Row {
                id: row4
                x: 0
                y: 0
                width: rectangle8.width
                height: 3*rectangle8.height/4
                opacity: 0

                Rectangle {
                    id: rectangle9
                    x: 0
                    y: 0
                    width: row4.width
                    height: row4.height
                    color: "#ffffff"

                    TextEdit {
                        id: text_edit3
                        x: 0
                        y: 0
                        width: row4.width
                        height: row4.height
                        font.pixelSize: 15
                    }
                }
            }

            Row {
                id: row5
                x: 0
                y: 3*rectangle8.height/4
                width: rectangle8.width
                height: rectangle8.height/4
                Button{
                    id: buttonUpdateByDate
                    width: 180
                    anchors.centerIn: parent
                    text:"Update by date"
                    onClicked: {

                        }
                }

            }
        }
}
    states:[
        State {
            name: "add"
            PropertyChanges { target: rectangle3; x: 32}
            PropertyChanges { target: rectangle7; x:-width-100 }
            PropertyChanges { target: rectangle8; x:-width-100 }
            PropertyChanges { target: rectangle5; x: -width-100 ;y: 0 }
            PropertyChanges { target: addScreen; x: column1.width-32 }
            PropertyChanges { target: showScreen; x: column1.width-16}
            PropertyChanges { target: arrowIcon_add; rotation: 180 }
            PropertyChanges { target: arrowIcon_show; rotation: 0 }

            PropertyChanges {
                target: showScreen
                y: 0
            }

            PropertyChanges {
                target: addScreen
                y: 0
            }

            PropertyChanges {
                target: updateScreen
                y: 0
            }

            PropertyChanges {
                target: delScreen
                y: 0
            }
        },
        State {
            name: "show"
            PropertyChanges { target: rectangle3; x:-width-100 }
            PropertyChanges { target: rectangle7; x:-width-100 }
            PropertyChanges { target: rectangle8; x:-width-100 }
            PropertyChanges { target: rectangle5; x: -width-100 ;y: 0 }
            PropertyChanges { target: showScreen; x: column1.width-16}
            PropertyChanges { target: arrowIcon_add; rotation: 0 }
            PropertyChanges { target: arrowIcon_show; rotation: 180 }

            PropertyChanges {
                target: showScreen
                y: 0
            }

            PropertyChanges {
                target: addScreen
                y: 0
            }

            PropertyChanges {
                target: updateScreen
                y: 0
            }

            PropertyChanges {
                target: delScreen
                y: 0
            }
        },
        State {
            name: "update"
            PropertyChanges { target: rectangle7; x:-width-100 }
            PropertyChanges { target: rectangle8; x:16;y:0 }
            PropertyChanges { target: rectangle3; x:-width-100 }
            PropertyChanges { target: rectangle5; x: -width-100 ;y: 0 }
            PropertyChanges { target: addScreen; x: column1.width-32 ;y: 0 }
            PropertyChanges { target: showScreen; x: column1.width-16 ;y: 0}
            PropertyChanges { target: updateScreen; x: column1.width-48 ;y: 0}
            PropertyChanges { target: arrowIcon_add; rotation: 0 }
            PropertyChanges { target: arrowIcon_show; rotation: 0 }
            PropertyChanges { target: arrowIcon_update; rotation: 180 }
            PropertyChanges {
                target: showScreen
                y: 0
            }

            PropertyChanges {
                target: addScreen
                y: 0
            }

            PropertyChanges {
                target: updateScreen
                y: 0
            }

            PropertyChanges {
                target: delScreen
                y: 0
            }

            PropertyChanges {
                target: rectangle8
                x: 16
                y: 0
                opacity: 1
            }

            PropertyChanges {
                target: row4
                opacity: 1
            }

            PropertyChanges {
                target: row5
                opacity: 1
            }

            PropertyChanges {
                target: rectangle9
                opacity: 1
            }

            PropertyChanges {
                target: text_edit3
                opacity: 1
            }
        },
        State {
            name: "del"
            PropertyChanges { target: rectangle7; x:0;y:0 }
            PropertyChanges { target: rectangle8; x:-width-100 }
            PropertyChanges { target: rectangle3; x:-width-100 }
            PropertyChanges { target: rectangle5; x: -width-100 ;y: 0 }
            PropertyChanges { target: addScreen; x: column1.width-32 ;y: 0 }
            PropertyChanges { target: showScreen; x: column1.width-16 ;y: 0}
            PropertyChanges { target: updateScreen; x: column1.width-48 ;y: 0}
            PropertyChanges { target: delScreen; x: column1.width-64 ;y: 0}
            PropertyChanges { target: arrowIcon_add; rotation: 0 }
            PropertyChanges { target: arrowIcon_show; rotation: 0 }
            PropertyChanges { target: arrowIcon_update; rotation: 0 }
            PropertyChanges { target: arrowIcon_del; rotation: 180 }
            PropertyChanges {
                target: showScreen
                y: 0
            }

            PropertyChanges {
                target: addScreen
                y: 0
            }

            PropertyChanges {
                target: updateScreen
                y: 0
            }

            PropertyChanges {
                target: delScreen
                y: 0
            }

            PropertyChanges {
                target: rectangle7
                y: 0
                opacity: 1
            }
        },
        State {
            name: "main"
            PropertyChanges { target: rectangle3; x:-width-100 }
            PropertyChanges { target: rectangle5; x: 64 ;y: 0 }
            PropertyChanges {
                target: showScreen
                y: 0
            }

            PropertyChanges {
                target: addScreen
                y: 0
            }

            PropertyChanges {
                target: updateScreen
                y: 0
            }

            PropertyChanges {
                target: delScreen
                y: 0
            }
        }
    ]

    Column {
        id: column2
        x: 2*rectangle1.width/3
        y: 0
        width: rectangle1.width/3
        height: rectangle1.height

        Button{
            id: buttonAdd
            x: column2.width/4
            y: 2*column2.height/8+5
            text:"Add"
            onClicked: {
                    rectangle1.state = "add"
                }
        }

        Button{
            id: buttonShow
            x: column2.width/4
            y: column2.height/8+5
            text:"Show"
            onClicked: {
                    rectangle1.state = "show"
            }
        }

        Button{
            id: buttonDel
            x: column2.width/4
            y: 4*column2.height/8+5
            text:"Delete"
            onClicked: {
                rectangle1.state="del"
            }
        }

        Button{
            id: buttonUpdate
            x: column2.width/4
            y: 3*column2.height/8+5
            text:"Update"
            onClicked: {
                rectangle1.state="update"
            }
        }

        Text {
            id: text1
            x: column2.width/4
            y: 5*column2.height/8+5
            text: qsTr("Enter date:")
            font.pixelSize: 15
            color: "white"
        }

Rectangle {
        id: rectangle2
        x: column2.width/4
        y: 6*column2.height/8
            width: 100
            height: 20
            color: "#ffffff"

            TextEdit {
                id: text_edit1
                x: 0
                y: 0
                width: rectangle2.width
                height: rectangle2.height
                //text: qsTr("text edit")
                font.pixelSize: 15
            }
}
    }



}
