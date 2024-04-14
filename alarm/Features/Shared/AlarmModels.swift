//
//  SharedModels.swift
//  alarm
//
//  Created by Chris Kasahara on 2024/04/09.
//

import Foundation

class AlarmItem: ObservableObject, Identifiable, CustomStringConvertible {
    var id = UUID()
    @Published var time: Date
    @Published var label: String
    @Published var isEnable: Bool
    @Published var repetitionDays: Set<WeekDay>
    @Published var isGradualVolumeModeEnabled: Bool
    @Published var isSnoozeEnabled: Bool
    @Published var isRandomAlarmSoundEnabled: Bool
    var alarmSettings: AlarmSettings?
    
    init(time: Date, label: String, isEnable: Bool, repetitionDays: Set<WeekDay>, isGradualVolumeModeEnabled: Bool, isSnoozeEnabled: Bool, isRandomAlarmSoundEnabled: Bool, alarmSettings: AlarmSettings? = nil) {
        self.time = time
        self.label = label
        self.isEnable = isEnable
        self.repetitionDays = repetitionDays
        self.isGradualVolumeModeEnabled = isGradualVolumeModeEnabled
        self.isSnoozeEnabled = isSnoozeEnabled
        self.isRandomAlarmSoundEnabled = isRandomAlarmSoundEnabled
        self.alarmSettings = alarmSettings
    }
    
    // CustomStringConvertibleプロトコルに準拠
    var description: String {
        return """
            ID: \(id)
            Time: \(time)
            Label: \(label)
            Is Enabled: \(isEnable)
            Repetition: \(repetitionDays)
            Gradual Volume Mode Enabled: \(isGradualVolumeModeEnabled)
            Snooze Enabled: \(isSnoozeEnabled)
            Random Alarm Sound Enabled: \(isRandomAlarmSoundEnabled)
            """
    }
}

struct AlarmSettings {
    // スヌーズの回数
    var snoozeTimes: Int?
    // スヌーズの間隔
    var snoozeInterval: Date?
    // 最大音量に到達するまでにかかる時間
    var maxVolumeRampTime: TimeInterval?
    // アラームの指定時間前に段階音量アラームを始めるか否か
    var isEarlyStartGradualVolume: Bool?
    
}

enum WeekDay: Int, CaseIterable {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    var name: String {
        switch self {
        case .sunday: return "日"
        case .monday: return "月"
        case .tuesday: return "火"
        case .wednesday: return "水"
        case .thursday: return "木"
        case .friday: return "金"
        case .saturday: return "土"
        }
    }
}
