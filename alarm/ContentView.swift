//
//  ContentView.swift
//  alarm
//
//  Created by Chris Kasahara on 2024/04/07.
//

import SwiftUI

struct ContentView: View {
    @State private var showingCreateView = false
    
    let calendar = Calendar(identifier: .gregorian)
    private var mockdata: [AlarmItem]
    
    init() {
        let time = calendar.date(from: DateComponents(hour: 10, minute: 24))
        mockdata = [
            AlarmItem(time: time ?? Date.now, label: "朝起きる", isEnable: true, repetitionDays: [.sunday, .monday, .tuesday], isGradualVolumeModeEnabled: true, isSnoozeEnabled: true, isRandomAlarmSoundEnabled: true, alarmSettings: AlarmSettings(snoozeTimes: 3)),
            AlarmItem(time: time ?? Date.now, label: "会議", isEnable: false, repetitionDays: [.monday, .tuesday, .wednesday, .thursday, .friday], isGradualVolumeModeEnabled: true, isSnoozeEnabled: false, isRandomAlarmSoundEnabled: false, alarmSettings: AlarmSettings(snoozeTimes: 1)),
            AlarmItem(time: time ?? Date.now, label: "ゆうすけを迎えに行く", isEnable: true, repetitionDays: Set<WeekDay>(), isGradualVolumeModeEnabled: false, isSnoozeEnabled: false, isRandomAlarmSoundEnabled: false),
            AlarmItem(time: time ?? Date.now, label: "洗濯を回す", isEnable: false, repetitionDays: [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday], isGradualVolumeModeEnabled: false, isSnoozeEnabled: false, isRandomAlarmSoundEnabled: true, alarmSettings: AlarmSettings(snoozeTimes: 1)),
            AlarmItem(time: time ?? Date.now, label: "ランニングへ行く", isEnable: false, repetitionDays: [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday], isGradualVolumeModeEnabled: false, isSnoozeEnabled: false, isRandomAlarmSoundEnabled: true, alarmSettings: AlarmSettings(snoozeTimes: 1)),
            AlarmItem(time: time ?? Date.now, label: "スムージーを飲む", isEnable: false, repetitionDays: [.sunday, .saturday], isGradualVolumeModeEnabled: false, isSnoozeEnabled: true, isRandomAlarmSoundEnabled: false, alarmSettings: AlarmSettings(snoozeTimes: 1)),
            AlarmItem(time: time ?? Date.now, label: "教会へ行く", isEnable: false, repetitionDays: [.sunday], isGradualVolumeModeEnabled: true, isSnoozeEnabled: false, isRandomAlarmSoundEnabled: true, alarmSettings: AlarmSettings(snoozeTimes: 1)),
        ]
    }
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    ScrollView {
                        Text("次のアラーム").font(.title3).fontWeight(.bold).frame(width: 300, alignment: .leading)
                        ItemView(alarmData: mockdata[0]).padding(.bottom)
                        
                        ListView(alarmDataList: mockdata)
                    }
                }
            }
            .navigationBarTitle("Wake!", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                showingCreateView = true
            }) {
                Image(systemName: "plus").foregroundColor(.orange)
            }).sheet(isPresented: $showingCreateView, content: {
                CreateView(showingCreateView: $showingCreateView)
            })
        }
    }
}

#Preview {
    ContentView()
}

