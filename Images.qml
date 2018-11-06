import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Rectangle {
    property string source_i : ""
    signal clicked()
    id: rect
//    color: "white"
    width: 75
    height: 75
    radius: width / 2
    color: mouseArea_i.pressed ? "#BCBABE" : "#F1F1F2"
    border.color: "#BCBABE"

    Image{
        fillMode: Image.PreserveAspectFit
        width: rect.width / 3
        height: rect.height / 3
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height  / 2
        id: first
        source: source_i === "" ? "files/images/home.png" : source_i
    }

    property alias mouseX: mouseArea_i.mouseX
    property alias mouseY: mouseArea_i.mouseY

    property bool containsMouse: {
//        console.log("[roundMouseArea] containsMouse: ENTERED ENTERED ENTERED ENTERED")
//        Math.sqrt((x1-x0)*(x1-x0) + (y1-y0)*(y1-y0)) < r
        var x1 = width / 2;
        var y1 = height / 2;
        var x2 = mouseX;
        var y2 = mouseY;
        var distanceFromCenter = Math.sqrt(Math.pow(x1 - x2, 2) + Math.pow(y1 - y2, 2));
        var radiusC = Math.min(width, height) / 2;
        var isWithinOurRadius = distanceFromCenter < radiusC;
        console.log("[roundMouseArea] containsMouse:", isWithinOurRadius);
        return isWithinOurRadius;
    }

    MouseArea {
        anchors.fill: parent
        id: mouseArea_i
        onClicked: {
            if(rect.containsMouse){
                //rect.color = "#BCBABE"
                rect.clicked()
            }
        }
    }
}

