//
//  GetWeekendStringList.swift
//  alarm
//
//  Created by Chris Kasahara on 2024/04/10.
//

import Foundation

struct WeekDayConverter {
    static func getWeekDayToString(weekdaySet: Set<WeekDay>) -> String {
        
        // Enumに準拠して、日〜土まで並べ替え
        let weekdaysSortedByRawValue = weekdaySet.sorted { $0.rawValue < $1.rawValue }
        
        // Enumから名前を取り出す
        let weekNames = weekdaysSortedByRawValue.map { $0.name }
        
        var viewString = weekNames.joined(separator: "・")
        print(weekdaysSortedByRawValue.contains(.sunday))
        if weekdaysSortedByRawValue.count == 5 && !weekdaysSortedByRawValue.contains(.sunday) && !weekdaysSortedByRawValue.contains(.saturday) {
            viewString = "平日"
        } else if weekdaysSortedByRawValue.count >= 7 {
            viewString = "毎日"
        } else if weekdaysSortedByRawValue.count == 2 && weekdaysSortedByRawValue.contains(.sunday) && weekdaysSortedByRawValue.contains(.saturday) {
            viewString = "毎週末"
        } else if weekdaysSortedByRawValue.count == 1 {
            viewString = "毎週\(weekNames[0])曜日"
        }
        
        
       return viewString
    }
}
