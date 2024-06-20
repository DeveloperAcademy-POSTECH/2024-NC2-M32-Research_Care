//
//  GraphView.swift
//  ResearchKit_Tut2
//
//  Created by Leo Yoon on 6/20/24.
//
import SwiftUI
import ResearchKit
import Charts

struct GraphView: View {
    @Binding var showModal: Bool            // 모달띄우기 변수
    @Binding var weeklyData: [DailyResponse]// 차트 띄우기 변수(1주일)
    @Binding var showYesData: Bool          // Yes/No 토글상태
//    let color_main = Color(red: 235/255, green: 106/255, blue: 100/255)
    let color_main = Color(red: 52/255, green: 120/255, blue: 246/255)

    
    var body: some View {
        VStack {
            
            ZStack{
                Chart {
                    ForEach(weeklyData) { data in
                        if !showYesData {
                            BarMark(
                                x: .value("Date", data.date, unit: .day),
                                y: .value("Count", data.yesCount)
                            )
//                            .foregroundStyle(Color.gray)
                            .foregroundStyle(Color(UIColor.systemGray5))
                            .annotation(position: .top) {
                                Text("\(data.yesCount)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        } else {
                            BarMark(
                                x: .value("Date", data.date, unit: .day),
                                y: .value("Count", data.noCount)
                            )
                            .foregroundStyle(color_main)
                            .annotation(position: .top) {
                                Text("\(data.noCount)")
                                    .font(.caption)
                                    .foregroundColor(color_main)                            }
                        }
                    }
                }
                .chartYScale(domain: 0...15)
                .frame(height: 300)
                .padding()
                .chartYAxis {
                    AxisMarks(position: .leading) {
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel()
                    }
                }
                .chartXAxis {
                    AxisMarks(position: .bottom) {
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel(format: .dateTime.day().month())
                    }
                }
                .chartXAxisLabel("Date", alignment: .trailing)
                .chartYAxisLabel(" ")
                // chartYAxisLabel은 ZStack+Text 조합으로 그렸습니다.
                .background(Color(UIColor.white).edgesIgnoringSafeArea(.all)) // 기본컬러로 메우기
                .frame(width: 350, height: 330)
                .cornerRadius(8)
                // (요기까지 차트)
                
                VStack{
                    Text("Count")
                        .font(.caption)
                        .foregroundStyle(Color(.gray))
                        .padding(.bottom, 4)
                        .frame(maxWidth:.infinity, alignment: .leading)
                    Spacer()
                }.frame(width: 350, height: 310)
                
                VStack{
                    HStack {
                        Text("건강지수 확인하기")
                        Toggle("", isOn: $showYesData)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: color_main))
                    }
                    .frame(maxWidth:.infinity, alignment: .trailing)
                    
                    Text("(버튼을 Off하면, 상담모드가 됩니다)")
                        .font(.caption)
                        .foregroundStyle(Color(.gray))
                        .frame(maxWidth:.infinity, alignment: .trailing)
                    Spacer()
                }.frame(width: 350, height: 450)
                    .padding(.trailing, 30)
            } // ZStack
        }
        
    }
}
struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        let init_chart = [              // 차트제작용 변수(1주일)
            // Example data for testing
            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, yesCount: 5, noCount: 5),
            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, yesCount: 7, noCount: 6),
            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, yesCount: 8, noCount: 7),
            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, yesCount: 6, noCount: 9),
            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, yesCount: 4, noCount: 9),
            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, yesCount: 9, noCount: 5)
        ]
        
        //        GraphView(chartData: .constant([true: 8, false: 5]), showModal: .constant(true)) // 1일용
        GraphView(showModal: .constant(true), weeklyData: .constant(init_chart), showYesData: .constant(true)) // 1주일용
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
