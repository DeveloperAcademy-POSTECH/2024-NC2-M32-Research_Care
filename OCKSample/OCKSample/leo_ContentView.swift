////
////  ContentView.swift
////  ResearchKit_Tut2
////
////  Created by Leo Yoon on 6/20/24.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var showModal = false
//    @State private var selectedSurvey: Int? = nil
//    @State private var chartData: [Bool: Int] = [true: 0, false: 0] // 차트제작용 변수
////
//
//    var body: some View {
//        VStack {
//            Text("Main View")
//                .font(.largeTitle)
//                .padding()
//
//            Button(action: {
//                selectedSurvey = 1
//                showModal = true
//            }) {
//                Text("Survey 1")
//                    .font(.title)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()
//
//            Button(action: {
//                selectedSurvey = 2
//                showModal = true
//            }) {
//                Text("Survey 2")
//                    .font(.title)
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()
//
//            Button(action: {
//                selectedSurvey = 3
//                showModal = true
//            }) {
//                Text("Survey 3")
//                    .font(.title)
//                    .padding()
//                    .background(Color.red)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()
//
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
//
//        }
//        .sheet(isPresented: $showModal) {
//            if selectedSurvey == 1 {
//                SurveyView1(showModal: $showModal)
//            } else if selectedSurvey == 2 {
//                SurveyView2(showModal: $showModal)
//            } else if selectedSurvey == 3 {
//                SurveyView3(chartData:$chartData, showModal: $showModal)
//            } else if selectedSurvey == 4 {
//                GraphView(chartData:$chartData, showModal: $showModal)
//            }
//        }
//    }
//}
//
//
//#Preview {
//    ContentView()
//}
