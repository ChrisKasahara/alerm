//
//  AlarmListView.swift
//  alarm
//
//  Created by Chris Kasahara on 2024/04/07.
//

import SwiftUI

struct ListView: View {
    @State var alarmDataList: [AlarmItem]
    
    var body: some View {
        ForEach(alarmDataList) {alarmData in
            ItemView(alarmData: alarmData)
        }
    }
}
