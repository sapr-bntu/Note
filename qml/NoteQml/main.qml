// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle{
    id: rectangle1
    width: 900
    height: 500
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
        id: columnLeft
        x: 0
        y: 0
        width: parent.width-parent.width/3
        height: parent.height


        Row {
            id: rowUp
            x: 0
            y: 0
            width: parent.width
            height: parent.height-parent.height/3


            ListView {
                id: listView
                width: 200;
                height:300

                model: ListModel {
                    id: listModel
                }
                delegate: petDelegate
                focus: true

                // Set the highlight delegate. Note we must also set highlightFollowsCurrentItem
                // to false so the highlight delegate can control how the highlight is moved.
                highlight: highlightBar
                highlightFollowsCurrentItem: false

                Component.onCompleted: {
                    var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);

                    db.transaction(
                                function(tx) {

                                    // Show all added greetings
                                    var rs = tx.executeSql('SELECT * FROM students');
                                    for(var i = 0; i < rs.rows.length; i++) {
                                        var data = {'firstname':rs.rows.item(i).firstname, 'middlename': rs.rows.item(i).middlename, 'lastname': rs.rows.item(i).lastname};
                                        listModel.append(data)

                                    }
                                    listModel.sync()
                                }
                                )
                }
            }
        }
        function dbInit() {
            var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);

            db.transaction(
                        function(tx) {
                            // Create the database if it doesn't already exist
                            tx.executeSql('CREATE TABLE IF NOT EXISTS [students] ([id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,'+
                                          '[firstname] VARCHAR(255)  NULL,'+
                                          '[lastname] VARCHAR(255)  NULL,'+
                                          '[middlename] VARCHAR(255)  NULL,'+
                                          '[group] VARCHAR(255)  NULL'+
                                          ');');

                            // Add (another) greeting row
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('32', 'Игорь', 'Авдей', 'Олегович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('33', 'Алексей', 'Анкип', 'Юрьевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('34', 'Дмитрий', 'Вашкевич', 'Иванович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('35', 'Сергей', 'Добродей', 'Гарриевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('36', 'Евгений', 'Завадский', 'Романович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('37', 'Александр', 'Казаковский', 'Владимирович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('38', 'Александр', 'Ковалевич', 'Николаевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('39', 'Андрей', 'Костелей', 'Александрович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('40', 'Анна', 'Кузнецова', 'Александровна', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('41', 'Дарья ', 'Минина', 'Дмитревна', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('42', 'Ярослав', 'Мещеряков', 'Олегович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('43', 'Сергей', 'Олиферко', 'Васильевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('44', 'Илья', 'Осиюк', 'Васильевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('45', 'Виктория', 'Павлова', 'Львовна', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('46', 'Ольга', 'Плышевская', 'Васильевна', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('47', 'Александр', 'Рубанов', 'Игоревич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('48', 'Алексей', 'Ругаин', 'Дмитревич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('49', 'Андрей', 'Савчук', 'Александрович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('50', 'Дмитрий', 'Семашко', 'Валерьевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('51', 'Артем', 'Шибалко', 'Алексеевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('52', 'Игорь', 'Якимуш', 'Степанович', '107518');");
                        }
                        )
        }
        function dbShow() {
            var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);

            db.transaction(
                        function(tx) {

                            // Show all added greetings
                            var rs = tx.executeSql('SELECT * FROM students');

                            var r = ""
                            for(var i = 0; i < rs.rows.length; i++) {
                                r += i+" "+rs.rows.item(i).firstname + ", " + rs.rows.item(i).middlename + ", " + rs.rows.item(i).lastname  + "\n"
                            }
                            txt.text = r
                        }
                        )
        }
        Component {
            id: petDelegate
            Item {
                id: wrapper
                width: 200; height: 55
                Column {
                    Text { text: 'Имя: ' + firstname }
                    Text { text: 'Отчество: ' + middlename }
                    Text { text: 'Фамилия: ' + lastname }
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

        Row {
            id: rowBottom
            x: 0
            y: parent.height-parent.height/3
            width: parent.width
            height: parent.height/3

            Row
            {
                id: rowAddBottom
                x: 0
                y: 0
                width: rowBottom.width/3
                height: rowBottom.height
                Button {
                    id: addButton
                    anchors.centerIn: parent
                    text: "Add note"
                    onClicked:{ columnLeft.dbInit()}
                }
            }
            Row
            {
                id: rowUpdateBottom
                x: rowBottom.width/3
                y: 0
                width: rowBottom.width/3
                height: rowBottom.height
                Button {
                    id: updateButton
                    anchors.centerIn: parent
                    text: "Update note"
                    onClicked: { columnLeft.dbShow()}
                }
            }
            Row
            {
                id: rowDelBottom
                x: 2*rowBottom.width/3
                y: 0
                width: rowBottom.width/3
                height: rowBottom.height
                Button {
                    id: delButton
                    anchors.centerIn: parent
                    text: "Delete note"
                    //onClicked:
                }
            }
        }
    }

    Column {
        id: columnRight
        x: parent.width-parent.width/3
        y: 0
        width: parent.width/3
        height: parent.height

        Row {
            id: rowCalendar
            x: 0
            y: 259
            width: parent.width
            height: 2*parent.height/3

            function selectText()
            {
                text_edit1.text="";
                textSelect.enabled=false;
                text_edit1.activeFocusOnPress=true;
            }

            Button {
                id: toDateButton
                x: parent.width/3
                y: 2*parent.height/3
                text: "Go to date"
                //onClicked:
                }

                TextEdit {
                    id: text_edit1
                    width: 120
                    height: 20
                    y: parent.height/3
                    text: qsTr("Enter date")
                    font.pixelSize: 15
                    color: "White"
                    MouseArea{
                        id: textSelect
                        anchors.fill: parent
                        onClicked: rowCalendar.selectText()
                    }
                }
        }

        Row {
            id: rowDate
            x: 0
            y: 2*parent.height/3
            width: parent.width
            height: parent.height/3


        }
    }
}

