import QtQuick 2.6
import QtQuick.Controls 1.5

ApplicationWindow {
    visible: true
    width: 400
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        ListModel {
            id: myModel
            ListElement {
                text1: "btn1"
                text2: "btn2"
                text3: "btn3"
            }
            ListElement {
                text1: "btn1"
                text2: "btn2"
                text3: "btn3"
            }
            ListElement {
                text1: "btn1"
                text2: "btn2"
                text3: "btn3"
            }
            ListElement {
                text1: "btn1"
                text2: "btn2"
                text3: "btn3"
            }
            ListElement {
                text1: "btn1"
                text2: "btn2"
                text3: "btn3"
            }
            ListElement {
                text1: "btn1"
                text2: "btn2"
                text3: "btn3"
            }
            ListElement {
                text1: "btn1"
                text2: "btn2"
                text3: "btn3"
            }
        }
        ListView {
            id: list
            anchors.fill: parent
            model: myModel
            currentIndex: 0
            focus: true
            delegate: Rectangle {
                id: delegateItem
                height: 100
                width: parent.width
                color: "blue"

                Row {
                    anchors.fill: parent
                    Button {
                        text: model.text1
                        height: parent.height

                        onFocusChanged: {
                            if (focus)
                                text = "selected"
                            else
                                text = model.text1
                        }
                        KeyNavigation.down: list.currentItem.children[0].children[1]
                    }
                    Button {
                        text: model.text1
                        height: parent.height

                        onFocusChanged: {
                            if (focus)
                                text = "selected"
                            else
                                text = model.text3
                        }
                        KeyNavigation.down: list.currentItem.children[0].children[2]
                         KeyNavigation.up: list.currentItem.children[0].children[0]
                    }
                    Button {
                        text: model.text1
                        height: parent.height

                        onFocusChanged: {
                            if (focus)
                                text = "selected"
                            else
                                text = model.text3
                        }
                         KeyNavigation.up: list.currentItem.children[0].children[1]
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log(list.currentItem)
                        this.focus=true
                    }
                }

                onFocusChanged: {
                    if (focus)
                        delegateItem.color = "red"
                    else
                        delegateItem.color = "blue"
                    console.log(list.currentItem.children[0])
                }
                Keys.onDownPressed:
                {
                        if (list.currentIndex + 1 < list.count)
                            list.currentIndex += 1
                }
                Keys.onUpPressed:
                {
                        if (list.currentIndex -1 > -1)
                            list.currentIndex -= 1

                }


                Keys.onSpacePressed: {
                    var focus=list.currentItem.children[0].children[children_index].focus
                    list.currentItem.children[0].children[children_index].focus
                            = !focus
                    if(focus)
                        list.currentItem.focus=true
                    console.log("entered: "+list.currentItem.children[0].children[0].focus)
                }
                property int children_index: 0
            }
        }
    }
}
