//
//  CreateView.swift
//  alarm
//
//  Created by Chris Kasahara on 2024/04/11.
//

import SwiftUI

struct CreateView: View {
    @Binding var showingCreateView: Bool
    @State private var date = Date()
    @State var times: Set<Date> = [Date(), Date()]
    @State var test = false
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("時間")) {
                    DatePicker("Label", selection: $date, displayedComponents: .hourAndMinute).datePickerStyle(WheelDatePickerStyle()).labelsHidden()
                    
                }
                
                Section {
                    Toggle("スヌーズ", isOn: $test)
                    Toggle("徐々に音を大きくする", isOn: $test)

                }

            }.navigationBarTitle("Alarm", displayMode: .inline).navigationBarItems(trailing: Button(action: {
                print(date)
                self.showingCreateView = false
            }, label: {
                Text("保存").foregroundStyle(.orange)
            })).navigationBarItems(leading: Button(action: {
                self.showingCreateView = false
            }, label: {
                Text("キャンセル") .foregroundStyle(.orange)
            })).onAppear {
                UITableView.appearance().backgroundColor = .blue
             }
            
        }
        
    }
}
