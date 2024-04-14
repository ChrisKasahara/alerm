import SwiftUI

struct ItemView: View {
    @ObservedObject var alarmData: AlarmItem
    
        private var formatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
        }
    private let bg = 0.15
    
    var body: some View {
        let timeString = formatter.string(from: alarmData.time)
        
        VStack {
            HStack {
                // 時間表示
                Text(timeString).font(.system(size: 40)).foregroundColor(.gray).frame(width: 110,alignment: .leading)
                
                
                // アラームの追加機能アイコン
                HStack(spacing: 15) {
                    Image(systemName: "wave.3.right").foregroundColor(alarmData.isGradualVolumeModeEnabled ? .blue : .gray)
                    Image(systemName: "timer").foregroundColor(alarmData.isSnoozeEnabled ? .pink : .gray)
                    Image(systemName: "music.quarternote.3").foregroundColor(alarmData.isRandomAlarmSoundEnabled ? .yellow : .gray)
                }.padding(.horizontal, 2)
                
                Toggle("", isOn: $alarmData.isEnable)
                
            }
            
            
            HStack {
                Text(alarmData.label).font(.footnote)
                    .foregroundStyle(Color(red: 0.7, green: 0.7, blue: 0.7))
                    .frame(width: 160, alignment: .leading)
                    .padding(.leading, 4)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text(WeekDayConverter.getWeekDayToString(weekdaySet: alarmData.repetitionDays)).font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color(red: 0.7, green: 0.7, blue: 0.7))
                    .lineLimit(1)
                    .truncationMode(.tail)
                
            }
            .frame(width: 300)
            
        }.frame(width: 300).padding(.horizontal, 20).padding(.vertical, 10).background(Color(red: bg, green: bg, blue: bg)).cornerRadius(10)
        
    }
}

#Preview {
    ItemView(alarmData: AlarmItem(time: Date.now, label: "朝起きる", isEnable: true, repetitionDays: Set<WeekDay>(), isGradualVolumeModeEnabled: true, isSnoozeEnabled: true, isRandomAlarmSoundEnabled: true))
}
