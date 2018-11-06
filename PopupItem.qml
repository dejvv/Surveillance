import QtQuick 2.6
import QtQuick.Layouts 1.0
import Qt.labs.platform 1.0
import QtQuick.Controls 2.2
import "MyConstants.js" as Constants

Popup {
    property string message : ""
    property int x_p: 50
    property int y_p: 50
    id: popup

    x: x_p === 50 ? parent.width : x_p / 2 - width / 2
    y: y_p === 50 ? parent.height : y_p * (7 / 8)

    background: Rectangle {
            border.color: "transparent"
            color: "black"
            opacity: 0.4
            radius: 5
    }
    contentItem:
        Text {
            anchors.centerIn: parent.Center
            id: naslov
            text: message == "" ? "Generic popup message" : message
            color: "white"
            font.bold: true
        }


    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 150}
    }
    exit: Transition {
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; duration: 150}
    }
}
