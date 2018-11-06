import QtQuick 2.7
import QtQuick.Layouts 1.0
import Qt.labs.platform 1.0
import QtQuick.Controls 2.2
import Qt.labs.folderlistmodel 2.2
import QtQuick.Controls.Styles 1.4
import "MyConstants.js" as Constants
import QtQuick.Templates 2.0 as T
import "."

ApplicationWindow {
    id: awesomeWindow
    visible: true
    width: 1024
    height: myVideo.height
    maximumHeight: myVideo.height
    minimumHeight: myVideo.height
//    height: 768
    title: qsTr("Surveillance system")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0
        Component.onCompleted: contentItem.interactive = false

        // ******** FIRST PAGE ********
        RowLayout {
            ChooseVideo{
                id: myVideo
                currentSwipeIndex: swipeView.currentIndex
                width: swipeView.width * 0.85
                height: width * 0.5625
                anchors.left: parent.left
                state: "play"
                onPlaying: {
//                    console.log("on playing")
                    if(!Constants.video_loaded){
//                        console.log("resized")
                        //awesomeWindow.height = myVideo.width * 0.5625
                        Constants.video_loaded = true;
                    }
                }
            }

            ColumnLayout{
                Rectangle{
//                    color: "blue"
                    width: swipeView.width * 0.15
                    height: parent.height / 2
                    anchors.top: parent.top
                    anchors.right: parent.right
//                    RoundMouseArea{
//                        id: rma
//                        width: 75
//                        height: 75
                        Images {
                            width: parent.width / 2
                            height: width
                            source_i : "files/images/photo.png"
                            x: parent.width / 2 - width / 2
                            y: parent.height * (2 / 3) - height / 2

                            onClicked: {
                                animateOpacity.start();
                                popup.open();
                                timerHidePopup.start();
                            }
                        }
//                        Rectangle {
//                            color: rma.pressed ? "red" : (rma.containsMouse ? "darkorange" : "transparent")
//                            border.color: "darkorange"
//                            radius: width / 2
//                            anchors.fill: parent
//                        }
//                    }
                }
                Rectangle{
//                    color:"red"
                    width: swipeView.width * 0.15
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    Images {
                        id: goToVideosImage
                        width: parent.width / 2
                        height: width
                        source_i : "files/images/cinema.png"
                        x: parent.width / 2 - width / 2
                        y: parent.height * (1 / 3) - height / 2

                        onClicked: {
                           swipeView.setCurrentIndex(1);
                           myVideo.state = "pause"
//                           console.log("Main video state:", myVideo.state)
                        }
                    }
                }
            }
        }
        // ******** END OF FIRST PAGE ********

        // ******** SECOND PAGE ********



//        Page {

//            BusyIndicator {
//               id: busyIndication
//               anchors.centerIn: parent
//               // 'running' defaults to 'true'
//             }

//            Button {
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.bottom: parent.bottom
//                text: busyIndication.running ? "Stop Busy Indicator" : "Start Busy Indicator"
//                checkable: true
//                checked: busyIndication.running
//                onClicked: busyIndication.running = !busyIndication.running
//            }

//            Images {
//                x: 500
//                y: 300
//            }

//            Rectangle {
//                id: rectangle1
//                x: 10
//                y: 10
//                width: 100
//                height: 100
//                color: "#aa1010"
//            }
//            Rectangle {
//                width: 100; height: 100
//                focus: true
//                color: mouseArea.containsMouse ? "#aa1010" : "#aa1111"
//                x: parent.width/2 - width/2
//                y: parent.height/2 - height/2
//                border.width: 10
//                border.color: mouseArea.containsMouse ? Constants.mainbg : "green"
//                radius: width / 2
//                Keys.onPressed: {
//                    if (event.key == Qt.Key_A) {
//                        console.log('Key A was pressed');
//                        event.accepted = true;
//                    }
//                }
//                MouseArea{
//                    id: mouseArea
//                    hoverEnabled: true
//                    anchors.fill: parent
//                    anchors.margins: 10
//                    acceptedButtons: Qt.LeftButton | Qt.RightButton
//                    onClicked: {
//                       if (mouse.button == Qt.RightButton)
//                           parent.color = 'blue';
//                       else
//                           parent.color = 'red';

//                       swipeView.setCurrentIndex(0);
//                       myVideo.state = "play"
//                    }
//                    cursorShape: Qt.IBeamCursor;
//                }
//            }
//            RoundMouseArea {
//                id: roundMouseArea
//                width: 100
//                height: 100
//                x: 100
//                y: 300

//                onClicked: {
//                    swipeView.setCurrentIndex(0);
//                    myVideo.state = "play"
//                    print("clicked")
//                }

//                // Show the boundary of the area and whether or not it's hovered.
//                Rectangle {
//                    color: roundMouseArea.pressed ? "red" : (roundMouseArea.containsMouse ? "darkorange" : "transparent")
//                    border.color: "darkorange"
//                    radius: width / 2
//                    anchors.fill: parent
//                }
//            }
//        }
        // ******** END OF SECOND PAGE ********
        RowLayout {
//            ListView {
//                width: swipeView.width * 0.75
//                height: swipeView.height
//                anchors.left: parent.left
//                model: nameModel
//                delegate: nameDelegate
//                focus: true
//                highlight: Rectangle {
//                    color: "lightblue"
//                    width: parent.width
//                }
//                section {
//                    property: "team"
//                    criteria: ViewSection.FullString
//                    delegate: Rectangle {
//                        color: "#b0dfb0"
//                        width: parent.width
//                        height: childrenRect.height + 4
//                        Text { anchors.horizontalCenter: parent.horizontalCenter
//                            font.pixelSize: 16
//                            font.bold: true
//                            text: section
//                        }
//                    }
//                }
//            }
            MediaFile {
                width: swipeView.width * 0.75
                height: (!ultimateMediaFile.stejt || ultimateMediaFile.stejt === "stop") ? swipeView.height : swipeView.height * 0.90
                sWidth: swipeView.width * 0.75
                sHeight:  (!ultimateMediaFile.stejt || ultimateMediaFile.stejt === "stop") ? swipeView.height : swipeView.height * 0.885
                anchors.left: parent.left
                anchors.top: parent.top
                id: ultimateMediaFile
                state: "play"
            }

            Rectangle{
                opacity: (!ultimateMediaFile.stejt || ultimateMediaFile.stejt === "stop") ? 0.0 : 1.0
                property real marginNumber: (swipeView.width * 0.1 * 0.5) - (swipeView.height * 0.75 * 0.5)
                id: containerBottom
                width: swipeView.width * 0.75 - stopPlayImage.x
//                width: swipeView.width * 0.75
                height: swipeView.height * 0.115
                anchors.bottom: parent.bottom
                anchors.left: parent.left
//                anchors.leftMargin: (swipeView.width * 0.1 * 0.5) - (swipeView.height * 0.75 * 0.5)
                anchors.leftMargin: stopPlayImage.x
                color: "transparent"

                Slider {
                    // value is read/write.
                    property bool reachedEnd: false

//                    onValueChanged: { handle.x = 2 + (value - from) * movieSlider.xMax / (to - from); }
                    onValueChanged: {
//                        console.log("value:", value, "duration of video:", to)
                        if(value === to){
                            reachedEnd = true
                            ultimateMediaFile.stejt = "pause"
                        }
                    }

//                    property real maximum: 1
//                    property real minimum: 1
                    property int xMax: movieSlider.width - handle.width - 4

                    id: movieSlider
                    visible: (!ultimateMediaFile.stejt || ultimateMediaFile.stejt === "stop") ? false : true
                    anchors.bottom: parent.bottom
                    width: containerBottom.width * 0.9
                    height: containerBottom.height
                    value: ultimateMediaFile.vid.position
                    to: ultimateMediaFile.vid.duration
                    from: 0
                    snapMode: Slider.NoSnap
                    stepSize: to * 0.001
                    smooth: true

                    onMoved: {
//                        console.log("[onMoved] state of video:", ultimateMediaFile.stejt, "value:", value, "duration of video:", to)
                        if(ultimateMediaFile.stejt === "pause" && value === to){
                            ultimateMediaFile.stejt = "play"
                        }

//                        console.log(movieSlider.stepSize)
                        ultimateMediaFile.vid.seek(movieSlider.value)
                    }


                    handle: Rectangle {
                           id: handle
                           x: movieSlider.visualPosition * (movieSlider.width - width)
                           y: (movieSlider.height - height) / 2
                           width: movieSlider.height * 0.5
                           height: movieSlider.height * 0.5

                           radius: movieSlider.height * 0.25
                           color: movieSlider.pressed ? "#BCBABE" : "#F1F1F2"
                           border.color: "#BCBABE"
                       }

                       background: Rectangle {
                           y: (movieSlider.height - height) / 2
                           height: movieSlider.height * 0.15
                           radius: height * 0.75
                           color: "#F1F1F2"

                           Rectangle {
                               width: movieSlider.visualPosition * parent.width
                               height: parent.height
                               color: "lightsteelblue"
                               radius: 2
                           }
                       }
                }

                Rectangle{
                    visible: (!ultimateMediaFile.stejt || ultimateMediaFile.stejt === "stop") ? false : true
                    width: containerBottom.width * 0.1
                    height: containerBottom.height
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    Images {
                        id: stopPlayImage
                        height: parent.height * 0.75
                        width: height
                        source_i : (!ultimateMediaFile.stejt || ultimateMediaFile.stejt === "pause") ? "files/images/play.png" : "files/images/pause.png"
                        x: parent.width / 2 - width / 2
                        y: parent.height * (1 / 2) - height / 2

                        onClicked: {
                            if(ultimateMediaFile.stejt === "play")
                                ultimateMediaFile.stejt = "pause";
                            else if(ultimateMediaFile.stejt === "pause")
                                ultimateMediaFile.stejt = "play"
                        }
                    }
                }



            }

//            Text { text: folderModel.status === FolderListModel.Ready ? 'Loaded' : 'Not loaded' }


//            ListModel {
//                id: contactModel
//                ListElement {
//                    name: "Bill Smith"
//                    number: "555 3264"
//                }
//                ListElement {
//                    name: "John Brown"
//                    number: "555 8426"
//                }
//                ListElement {
//                    name: "Sam Wise"
//                    number: "555 0473"
//                }
//            }

//            ListView {
//                id: list
//                width: 180; height: 200
//                model: contactModel
//                delegate: Text { text: name }

//                highlight: highlight
//                highlightFollowsCurrentItem: false
//                focus: true
//            }

//            ListView {
//                id: list1
//                width: 180; height: 200

//                Component {
//                    id: contactsDelegate
//                    Rectangle {
//                        id: wrapper
//                        width: 180
//                        height: contactInfo.height
//                        color: ListView.isCurrentItem ? "black" : "red"
//                        Text {
//                            id: contactInfo
//                            text: name + ": " + number
//                            color: wrapper.ListView.isCurrentItem ? "#F1F1F2" : "black"
//                            MouseArea {
//                                           anchors.fill: parent
//                                           onClicked: list1.currentIndex = index
//                                       }
//                        }
//                    }
//                }

//                model: contactModel
//                delegate: contactsDelegate
//                focus: true
//            }
//            Rectangle
//                {
//                    anchors.centerIn: parent
//                    width : 300
//                    height: 300
//                    color: "pink"

//                    CustomBorder
//                            {
//                                commonBorder: false
//                                lBorderwidth: 5
//                                rBorderwidth: 0
//                                tBorderwidth: 0
//                                bBorderwidth: 0
//                                borderColor: "blue"
//                            }
//                }


//            Component {
//                id: highlight
//                Rectangle {
//                    width: 180; height: 20
//                    color: "lightsteelblue"; radius: 5
//                    y: chooseFileView.currentItem.y
//                    Behavior on y {
//                        SpringAnimation {
//                            spring: 3
//                            damping: 0.2
//                        }
//                    }
//                }
//            }

//            Rectangle {
//                id: container
//                width: 300
//                height: 360

//                ListModel {
//                    id: animalsModel
//                    ListElement { name: "Ant"; size: "Tiny" }
//                    ListElement { name: "Flea"; size: "Tiny" }
//                    ListElement { name: "Parrot"; size: "Small" }
//                    ListElement { name: "Guinea pig"; size: "Small" }
//                    ListElement { name: "Rat"; size: "Small" }
//                    ListElement { name: "Butterfly"; size: "Small" }
//                    ListElement { name: "Dog"; size: "Medium" }
//                    ListElement { name: "Cat"; size: "Medium" }
//                    ListElement { name: "Pony"; size: "Medium" }
//                    ListElement { name: "Koala"; size: "Medium" }
//                    ListElement { name: "Horse"; size: "Large" }
//                    ListElement { name: "Tiger"; size: "Large" }
//                    ListElement { name: "Giraffe"; size: "Large" }
//                    ListElement { name: "Elephant"; size: "Huge" }
//                    ListElement { name: "Whale"; size: "Huge" }
//                }

//                // The delegate for each section header
//                Component {
//                    id: sectionHeading
//                    Rectangle {
//                        id: sectionHeadingRectangle
//                        width: container.width
//                        height: childrenRect.height
//                        color: "orange"

//                        Text {
//                            text: section
//                            font.bold: true
//                            font.pixelSize: 20;
//                        }
//                    }
//                }

//                Component {
//                    id: section
//                    Rectangle {
//                        width: container.width
//                        height: mainText.height

//                        Text { id: mainText; text: name; font.pixelSize: 18 }
//                    }
//                }

//                ListView {
//                    id: view
//                    anchors.fill: parent
//                    // width: parent.width
//                    model: animalsModel
//                    delegate: section

//                    section.property: "size"
//                    section.criteria: ViewSection.FullString
//                    section.delegate: sectionHeading
//                }
//            }









            ColumnLayout{
                ListView {
                    id: chooseFileView
                    width: swipeView.width * 0.25
                    height: parent.height * 0.75
//                    anchors.bottom: parent.top
                    anchors.right: parent.right
                    highlight: Rectangle {
                        width: parent.width * 0.9
                        color: "lightsteelblue"; radius: 3
                        y: 0 || chooseFileView.currentItem.y
                        Behavior on y {
                            SpringAnimation {
                                spring: 3
                                damping: 0.2
                            }
                        }
                    }
//                    highlight: highlight
                    currentIndex: -1
//                    highlightFollowsCurrentItem: false
                    focus: true
//                    section {
//                        property: "team"
//                        criteria: ViewSection.FullString
//                        delegate: Rectangle {
//                            color: "#b0dfb0"
//                            width: parent.width
//                            height: childrenRect.height + 4
//                            Text { anchors.horizontalCenter: parent.horizontalCenter
//                                font.pixelSize: 16
//                                font.bold: true
//                                text: section
//                            }
//                        }
//                    }

                    Rectangle {
                        width: parent.width
                        height: parent.height
                        anchors.centerIn: parent
                        color: "transparent"
                        opacity: 0.5
                        Rectangle { // a border
                            anchors.left: parent.left
                            height: parent.height
                            width: 1
                            color: "#BCBABE"
                        }
                    }
                    Component {
                        id: fileDelegate

                        Item {
                            id: wrap
                            width: parent.width
                            height: parent.width * 0.15
//                            Text {
//                                id: nameOfFile
//                                text: fileName
//                            }
                            Text {
                                id: nameOfFile
                                text: fileName
                                font.pointSize: parent.height * 0.3
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                color: "black"
                                font.bold: wrap.ListView.isCurrentItem ? true: false
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MouseArea {
                                id: mouse_area1
                                z: 1
                                hoverEnabled: false
                                anchors.fill: parent

                                onClicked: {
                                    console.log("current item:", wrap.ListView.currentItem, "index:", wrap.ListView.currentIndex)
//                                    console.log("delegate clicked!!!!", folderModel.folder + fileName)
                                    chooseFileView.currentIndex = index
                                    console.log(chooseFileView.currentIndex)
                                    if (fileName.endsWith(".mp4")){
                                        resetThings(true);
                                        setThings("video", folderModel.folder + "/" + fileName)

                                    } else
                                        resetThings(true);
                                        setThings("image", folderModel.folder + "/" + fileName);
                                }
                            }
                        }

                    }
                    FolderListModel {
                        id: folderModel
                        nameFilters: ["*.qml", "*.png", "*.mp4" ]
//                        folder: "file:///Users/david/Desktop"
                        folder: "file:///Volumes/Space/Documents/Faks/2.letnik/UV/Projekt/video-samples/"
//                        folder: "file:///Users/david/Desktop/media-files"
                        showDirs: false
//                        ListElement { fileName: "Alice"; team: "Crypto" }
//                        ListElement { name: nameOfFile.fileName; team: nameOfFile.fileName.endswith(".mp4") ? "Videos" : "Photos" }
                    }

                    model: folderModel
                    delegate: fileDelegate
                }

                Rectangle{
//                    color: "gray"
                    width: swipeView.width * 0.25
                    height: parent.height * 0.25
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    Rectangle {
                        width: parent.width
                        height: parent.height
                        anchors.centerIn: parent
                        color: "transparent"
                        opacity: 0.5
                        Rectangle { // a border
                            anchors.left: parent.left
                            height: parent.height
                            width: 1
                            color: "#BCBABE"
                        }
                    }
                    Images {
                        width: goToVideosImage.width
                        height: width
                        source_i : "files/images/back.png"
                        x: parent.width / 2 - width / 2
                        y: parent.height * (1 / 2) - height / 2

                        onClicked: {
                           swipeView.setCurrentIndex(0);
                           myVideo.state = "play";
                           resetThings(false);
                        }
                    }
                }
            }
        }
    }

    PopupItem{
        id: popup
        x_p: myVideo.width
        y_p: myVideo.height
        message: "Photo successfuly taken"
    }



    // flash screen when photo is taken
    Rectangle{
        id: flashy
        width: myVideo.width
        height: parent.height
        color: animateOpacity.running ? "white" : "transparent"
        z: 5
    }


    NumberAnimation {
        id: animateOpacity
        target: flashy
        properties: "opacity"
        from: 0.01
        to: 1.0
        duration: 150
        loops: 1
    }


    Loader
    {
        id: loader
        anchors.fill: parent
    }

    Timer{
        id: timerHidePopup
        interval: 2000; running: false;
        onTriggered: {
            popup.close();
        }
    }

    ListModel {
        id: nameModel
        ListElement { name: "Alice"; team: "Crypto" }
        ListElement { name: "Bob"; team: "Crypto" }
        ListElement { name: "Jane"; team: "QA" }
        ListElement { name: "Victor"; team: "QA" }
        ListElement { name: "Wendy"; team: "Graphics" }
    }
    Component {
        id: nameDelegate
        Text {
            text: name;
            font.pixelSize: 24
            anchors.left: parent.left
            anchors.leftMargin: 2
        }
    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: swipeView.currentIndex
//        TabButton {
//            id: camera_feed_button
//            text: qsTr("First")
//            onClicked: myVideo.state = "play"
//        }
//        TabButton {
//            id: choose_video_button
//            text: qsTr("Second")
//            onClicked: myVideo.state = "pause"
//        }
//    }


    // change represents whether i'm changing from video to image or vice versa
    function resetThings(change){
        if(change){
            ultimateMediaFile.stejt = "stop";
            ultimateMediaFile.visible_i = false
        } else{
            if(ultimateMediaFile.stejt === "play")
                ultimateMediaFile.stejt = "pause";
        }

    }

    function setThings(what, path){
        if(what === "video"){
//            ultimateMediaFile.stejt = "stop"
//            console.log("[set] video stopped");
            ultimateMediaFile.source_v = path
            ultimateMediaFile.stejt = "play"
        } else {
            ultimateMediaFile.source_i = path
            ultimateMediaFile.visible_i = true
        }
    }

}

