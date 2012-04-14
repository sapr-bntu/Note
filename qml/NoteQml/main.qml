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

        Rectangle {
            id: rectangle3
            x: 0
            y: 0
            width: column1.width
            height: column1.height
            visible: false
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
                width: column1.width
                height: column1.height/5

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
                id: row3
                x: 0
                y: column1.height/5
                width: column1.width
                height: column1.height/5

                Text {
                    id: text3
                    x: row3.width/7
                    y: row3.height/2
                    text: qsTr("text")
                    font.pixelSize: 12
                }

                Rectangle {
                    id: rectangle5
                    x: 2*row3.width/6
                    y: row3.height/2
                    width: 100
                    height: 20
                    color: "#ffffff"

                    TextEdit {
                        id: text_edit3
                        x: 0
                        y: 0
                        width: rectangle5.width
                        height: rectangle5.height
                        font.pixelSize: 15
                    }
                }
            }

            Row {
                id: row2
                x: 0
                y: 2*column1.height/5
                width: column1.width
                height: 3*column1.height/5


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
        }
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
                rectangle3.visible=true
            }
        }
        Button{
            id: buttonShow
            x: column2.width/4
            y: column2.height/5
            text:"Show"
            onClicked: {
                rectangle3.visible=true
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
            y: column2.height/15
            text: qsTr("Enter date:")
            font.pixelSize: 15
            color: "white"
        }

        Rectangle {
            id: rectangle2
            x: column1.width/8
            y: column2.height/8
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

