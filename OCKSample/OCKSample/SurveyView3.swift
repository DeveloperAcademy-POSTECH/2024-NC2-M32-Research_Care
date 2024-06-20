import SwiftUI
import ResearchKit
//import ResearchKitUI

struct SurveyView3: View {
    @State private var responses: [Bool?] = Array(repeating: nil, count: 13)    // Survey띄우기 변수
    @Binding var showModal: Bool            // 모달띄우기 변수
    @Binding var weeklyData: [DailyResponse]// 차트 띄우기 변수(1주일)

    let questions = [
        "맥박이 빠르게 뛰고 심장박동이 빠르다.",
        "어지러움증이 있다.",
        "손발에 떨림이 있다.",
        "가슴에 통증이 있다.",
        "질식감이 든다.",
        "호흡이 가쁘다.",
        "속이 거북하거나 구토감이 있다.",
        "땀이 많다.",
        "오한이나 화끈한 느낌이 있다.",
        "손발이 저리거나 마비되는 느낌이 있다.",
        "자신이 변한 것 같다.",
        "죽을 것 같은 공포가 있다.",
        "자제력을 잃을 것 같거나 미칠 것 같은 두려움이 있다."
    ]
    
    @available(iOS 16.0, *)
    var body: some View {
        VStack {
            HStack{
                Spacer(minLength: 10)
                    Text("마음 알아보기")
                        .font(.title2)
                        .padding()
                        .bold()
                        .frame(maxWidth:.infinity, alignment: .leading)

            }
            
            HStack{
                Spacer(minLength: 30)
                Text("오늘 당신의 마음을 알아보세요\n아래 설문에서 Yes/No를 세어봅시다.")
                    .font(.subheadline)
                    .frame(maxWidth:.infinity, alignment: .leading)
            }
            
            List(0..<questions.count, id: \.self) { index in
                HStack {
                    Text(questions[index])
                    Spacer()
                    Picker(selection: $responses[index], label: Text("")) {
                        Text("Yes").tag(true as Bool?)
                        Text("No").tag(false as Bool?)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 100)
                }
            }
            
            Button(action: submitResponses) { //다른 뷰와 통합해서 없애기...
                Text("Submit")
                    .font(.title3)
                    .frame(maxWidth:.infinity)
                    .padding(16)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 10)
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)) // 기본컬러로 메우기
    }
    
    func submitResponses() {
        var stepResults = [ORKStepResult]()
        // Yes/No Count 데이터 전송용
        var yesCount = 0
        var noCount = 0
        
        for (index, response) in responses.enumerated() {
            let booleanQuestionResult = ORKBooleanQuestionResult(identifier: "Question\(index + 1)")
            booleanQuestionResult.booleanAnswer = response as NSNumber?
            
            let stepResult = ORKStepResult(stepIdentifier: "Step\(index + 1)", results: [booleanQuestionResult])
            stepResults.append(stepResult)
            
            // Yes/No Count 데이터 전송용
            if let answer = response {
                if answer {
                    yesCount += 1
                } else {
                    noCount += 1
                }
            }
            
        }
        
        let taskResult = ORKTaskResult(taskIdentifier: "SurveyTask", taskRun: UUID(), outputDirectory: nil)
        taskResult.results = stepResults
        
        // Yes/No Count 데이터 전송용(1주일용)
        let todayResponse = DailyResponse(date: Date(), yesCount: yesCount, noCount: noCount)
        if weeklyData.count >= 7 {
            weeklyData.removeLast() // 최대 7개의 데이터만 유지(오늘꺼를 최신화)
        }
        weeklyData.append(todayResponse)
        
        // Do something with taskResult, e.g., send to server or store locally
        print("Survey results: \(taskResult)")
    }
}


struct DailyResponse: Identifiable {
    let id = UUID()
    let date: Date
    let yesCount: Int
    let noCount: Int
}

struct SurveyView3_Previews: PreviewProvider {
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
        
        SurveyView3(showModal: .constant(true), weeklyData: .constant(init_chart)) // 1주일용
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
