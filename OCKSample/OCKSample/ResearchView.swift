//
//  ContentView.swift
//  ResearchKit_Tut2
//
//  Created by Leo Yoon on 6/20/24.
//

import SwiftUI
import Foundation

struct ResearchView: View {
    @State private var showModal = false
    @State private var selectedSurvey: Int? = nil
    @State private var chartData: [Bool: Int] = [true: 0, false: 0] // 차트제작용 변수(1일)
    @State private var showYesData: Bool = true                     // YES/NO 토글 상태 / 1주일용
    @State private var weeklyData: [DailyResponse] = [              // 차트제작용 변수(1주일)
        // Example data for testing
        DailyResponse(date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, yesCount: 5, noCount: 5),
        DailyResponse(date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, yesCount: 7, noCount: 6),
        DailyResponse(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, yesCount: 8, noCount: 7),
        DailyResponse(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, yesCount: 6, noCount: 9),
        DailyResponse(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, yesCount: 4, noCount: 9),
        DailyResponse(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, yesCount: 9, noCount: 5)
    ]
    
    
    var body: some View {
        VStack {
            HStack{
                Spacer(minLength: 10)
                Text("매일 돌아보기")
                    .font(.title)
                    .padding()
                    .bold()
                    .frame(maxWidth:.infinity, alignment: .leading)
            }
            
            HStack{
                Spacer(minLength: 30)
                Text("오늘은 어떠셨나요?\n스스로를 돌보는 시간을 가져봅시다.")
                    .font(.callout)
                    .frame(maxWidth:.infinity, alignment: .leading)
            }
            
            Button(action: {
                selectedSurvey = 3
                showModal = true
            }) {
                Text("오늘 내 기분 돌아보기")
                    .font(.title2)
                    .frame(maxWidth:.infinity, minHeight: 30)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(20)
            
            HStack{
                Spacer(minLength: 30)
                Text("지난 나 돌아보기")
                    .font(.title)
                    .padding(.bottom, 0)
                    .bold()
                    .frame(maxWidth:.infinity, alignment: .leading)
            }
            
            VStack{
                
                
                HStack{
                    Text("나의 건강상태를 돌아봅시다.")
                        .font(.callout)
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
                HStack{
                    Text("1주일의 건강상태를 보여드립니다.")
                        .font(.callout)
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
            }
            .frame(width: 320)
            .padding(12)
            .background(.white)
            .cornerRadius(12)

            //            Spacer()
            GraphView(showModal: $showModal, weeklyData: $weeklyData, showYesData: $showYesData) // 1주일용
                .frame(minWidth: 500)
            
            //            Button(action: {
            //                selectedSurvey = 4
            //                showModal = true
            //            }) {
            //                Text("GraphView(Svy.3)")
            //                    .font(.title)
            //                    .padding()
            //                    .background(Color.gray)
            //                    .foregroundColor(.white)
            //                    .cornerRadius(10)
            //            }
            //            .padding()
            //            GraphView(chartData:$chartData, showModal: $showModal) // 1일용
            
            Spacer()
        }
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)) // 배경 기본컬러로 메우기
        .sheet(isPresented: $showModal) {
            //            if selectedSurvey == 1 {
            //                SurveyView1(showModal: $showModal)
            //            } else if selectedSurvey == 2 {
            //                SurveyView2(showModal: $showModal)
            //            } else if selectedSurvey == 3 {
            if selectedSurvey == 3 {
                //                SurveyView3(chartData:$chartData, showModal: $showModal) // 1일용
                SurveyView3(showModal: $showModal, weeklyData: $weeklyData) // 1주일용
            } else if selectedSurvey == 4 {
                //                GraphView(chartData:$chartData, showModal: $showModal) // 1일용
                GraphView(showModal: $showModal, weeklyData: $weeklyData, showYesData: $showYesData) // 1주일용
            }
        }
    }
}

#Preview{
    ResearchView()
}


//struct ResearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        let init_chart = [
//            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, yesCount: 5, noCount: 8),
//            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, yesCount: 7, noCount: 6),
//            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, yesCount: 8, noCount: 7),
//            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, yesCount: 6, noCount: 9),
//            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, yesCount: 4, noCount: 10),
//            DailyResponse(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, yesCount: 9, noCount: 5)
//        ]
//
//        ResearchView(showModal: .constant(true), weeklyData: .constant(init_chart))
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
