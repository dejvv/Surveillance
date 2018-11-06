import QtQuick 2.0

Item {
    id: roundMouseArea

    property alias mouseX: mouseArea.mouseX
    property alias mouseY: mouseArea.mouseY

    property bool containsMouse: {
//        console.log("[roundMouseArea] containsMouse: ENTERED ENTERED ENTERED ENTERED")
//        Math.sqrt((x1-x0)*(x1-x0) + (y1-y0)*(y1-y0)) < r
        var x1 = width / 2;
        var y1 = height / 2;
        var x2 = mouseX;
        var y2 = mouseY;
        var distanceFromCenter = Math.sqrt(Math.pow(x1 - x2, 2) + Math.pow(y1 - y2, 2));
        var radiusSquared = Math.min(width, height) / 2;
        var isWithinOurRadius = distanceFromCenter < radiusSquared;
//        console.log("[roundMouseArea] containsMouse:", isWithinOurRadius);
        return isWithinOurRadius;
    }

    readonly property bool pressed: containsMouse && mouseArea.pressed

    signal clicked

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: if (roundMouseArea.containsMouse) roundMouseArea.clicked()
    }
}
