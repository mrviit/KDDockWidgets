/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2020 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sergio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

import QtQuick 2.6
import QtQuick.Controls 2.12
import com.kdab.dockwidgets 2.0 as KDDW

/// The top 3 tabbed dock widgets were created in C++, while the bottom 2 (dock4 and dock5) were created in QML

ApplicationWindow {
    id: window
    visible: true
    width: 1000
    height: 800
    color: "#2B3B60"
//    color: "transparent"
    flags:
        Qt.FramelessWindowHint
        | Qt.Window

    menuBar: MenuBar {
        Menu {
            title: qsTr("&Misc")
            Action {
                // For demonstration purposes, show how to change title:
                text: qsTr("Change title of #4")
                onTriggered: {
                  dock4.title = "new title";
                }
            }
        }
    }
    Rectangle {
        color: "transparent"
        anchors.fill: parent
    }
    KDDW.DockWidget {
        id: dock4
        uniqueName: "dock4"
        Rectangle {
            color: "transparent"
            anchors.fill: parent
//            Text {
//                font.pixelSize: 25
//                text: "Four"
//                anchors.centerIn: parent
//            }
        }
    }

    KDDW.DockWidget {
        id: dock5
        uniqueName: "dock5"
        Rectangle {
          color: "transparent"
          anchors.fill: parent
//          Text {
//              font.pixelSize: 25
//              text: "Five"
//              anchors.centerIn: parent
//          }
        }
    }

    KDDW.DockingArea {
        id: dockWidgetArea
//        anchors.fill: parent
        anchors.top: parent.top
        anchors.topMargin: 18
        anchors.left: parent.left
        anchors.leftMargin: (18)
        anchors.right: parent.right
        anchors.rightMargin: (18)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: (18)

        uniqueName: "MyMainLayout"
//        Rectangle {
//          color: "transparent"
//          anchors.fill: parent
//          border.width: 11
//          border.color: "red"
//        }
        Component.onCompleted: {
           addDockWidget(dock4, KDDW.KDDockWidgets.Location_OnBottom);
//           dock4.addDockWidgetAsTab(dock5);
        }
    }
}
