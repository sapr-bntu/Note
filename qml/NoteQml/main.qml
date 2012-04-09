// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle{
    id: rectangle1
    width: 600
    height: 400
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
    }
    Column {
        id: column2
        x: 2*rectangle1.width/3
        y: 0
        width: rectangle1.width/3
        height: rectangle1.height
        Button{
            id: buttonAdd
            x: column2.width/4
            y: 2*column2.height/5
            text:"Add"
            onClicked: {

            }
        }
        Button{
            id: buttonDel
            x: column2.width/4
            y: 3*column2.height/5
            text:"Delete"
            onClicked: {

            }
        }
        Button{
            id: buttonUpdate
            x: column2.width/4
            y: 4*column2.height/5
            text:"Update"
            onClicked: {

            }
        }

        Text {
            id: text1
            x: column2.width/4
            y: column2.height/7
            text: qsTr("Enter date:")
            font.pixelSize: 15
            color: "white"
        }

        Rectangle {
            id: rectangle2
            x: column1.width/8
            y: column2.height/5
            width: 120
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

