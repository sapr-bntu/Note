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

    function enterDate()
    {
        if(text_edit1.text=="")
        {
            return true
        }
        else
        {
            return false
        }
    }

    function enterDateAdd()
    {
        if(text_edit2.text=="")
        {
            return true
        }
        else
        {
            return false
        }
    }

    Column {
        id: column1
        x: 0
        y: 0
        width: 2*rectangle1.width/3
        height: rectangle1.height

        function dbAdd() {
            var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);

            db.transaction(
                        function(tx) {
                            // Create the database if it doesn't already exist
                            tx.executeSql('CREATE TABLE IF NOT EXISTS [note] ([id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,'+
                                          '[date] VARCHAR(255) NOT NULL,'+
                                          '[textnote] TEXT  NULL);');

                            // Add (another) greeting row
                            tx.executeSql("insert into note ('date', 'textnote') values ("+text_edit2.text+" , "+ text_edit4.text+");");
                        }
                        )
        }
        function dbShow() {
            var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);

           db.transaction(
                        function(tx) {

                            // Show all added greetings
                           var rs = tx.executeSql('SELECT * FROM note');

                            var r = ""
                            for(var i = 0; i < rs.rows.length; i++) {
                                r += i+" "+rs.rows.item(i).id + ", " + rs.rows.item(i).date + ", " + rs.rows.item(i).text  + "\n"
                            }
                            txt.text = r
                        }
                        )
        }


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
                        if(rectangle1.enterDateAdd())
                        {
                            text_edit2.text="Enter date!!!"
                        }
                        else
                        {
                            column1.dbAdd()
                        }
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
                listView.dbshow()
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
                    if(rectangle1.enterDate())
                        text_edit1.text="Enter date!!!"
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
                        if(rectangle1.enterDate())
                            text_edit1.text="Enter date!!!"
                        }
                }

            }
        }

        Rectangle {
            id: rectangle10
            x: 48
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

            Component {
                id: petDelegate
                Item {
                    id: wrapper
                    width: 200; height: 55
                    Column {
                        Text { text: 'Имя: ' + id }
                        Text { text: 'Отчество: ' + date }
                        Text { text: 'Фамилия: ' + textnote }
                    }
                    // indent the item if it is the current item
                    states: State {
                        name: "Current"
                        when: wrapper.ListView.isCurrentItem
                        PropertyChanges { target: wrapper; x: 20 }
                    }
                    transitions: Transition {
                        NumberAnimation { properties: "x"; duration: 200 }
                    }
                }
            }

            // Define a highlight with customised movement between items.
            Component {
                id: highlightBar
                Rectangle {
                    color: "lightsteelblue"; radius: 5
                    width: 200; height: 50
                    y: listView.currentItem.y;
                    Behavior on y { SpringAnimation { spring: 2; damping: 0.1 } }
                }
            }

            ListView {
                id: listView
                x: 0
                y: 0
                width: rectangle10.width
                height:rectangle10.height

                model: ListModel {
                    id: listModel
                }
                delegate: petDelegate
                focus: true

                // Set the highlight delegate. Note we must also set highlightFollowsCurrentItem
                // to false so the highlight delegate can control how the highlight is moved.
                highlight: highlightBar
                highlightFollowsCurrentItem: false

                function dbshow()
                {
                    var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);

                    db.transaction(
                                function(tx) {

                                    // Show all added greetings
                                    var rs = tx.executeSql('SELECT * FROM note');
                                    for(var i = 0; i < rs.rows.length; i++) {
                                        var data = {'id':rs.rows.item(i).id, 'date': rs.rows.item(i).date, 'textnote': rs.rows.item(i).textnote};
                                        listModel.append(data)

                                    }
                                    listModel.sync()
                                }
                                )
                }

                Component.onCompleted: {
                    dbshow()
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
            PropertyChanges { target: showScreen; x: column1.width-16 ;y: 0}
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

            PropertyChanges {
                target: rectangle10
                y: 0
                opacity: 1
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

    transitions: [
        Transition {
            to: "show"
            NumberAnimation { target: showScreen; properties: "x"; duration: 150; easing.type: Easing.OutExpo }
        },
        Transition {
            to: "add"
            NumberAnimation { target: addScreen; properties: "x"; duration: 150; easing.type: Easing.OutExpo }
            NumberAnimation { target: rectangle3; properties: "x"; duration: 150; easing.type: Easing.OutExpo }
        },
        Transition {
            to: "update"
            NumberAnimation { target: updateScreen; properties: "x"; duration: 150; easing.type: Easing.OutExpo }
            NumberAnimation { target: rectangle8; properties: "x"; duration: 150; easing.type: Easing.OutExpo }
        },
        Transition {
            to: "del"
            NumberAnimation { target: delScreen; properties: "x"; duration: 150; easing.type: Easing.OutExpo }
            NumberAnimation { target: rectangle7; properties: "x"; duration: 150; easing.type: Easing.OutExpo }
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
                    listView.dbshow()
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
                font.pixelSize: 15
            }
}
    }



}
