
import SwiftUI
import ResearchKit
import ResearchKitUI

public var SurveyTask: ORKOrderedTask {
    var steps = [ORKStep]()
    
    // Create an ORKFormStep to hold all the questions
    let formStep = ORKFormStep(identifier: "FormStep", title: "Health Survey", text: "Please answer the following questions:")
    
    // List of questions
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
    
    // Function to create form items from questions
    func createFormItems(from questions: [String]) -> [ORKFormItem] {
        var formItems = [ORKFormItem]()
        for (index, question) in questions.enumerated() {
            let answerFormat = ORKBooleanAnswerFormat() // Yes/No format
            let formItem = ORKFormItem(identifier: "FormItem\(index + 1)", text: question, answerFormat: answerFormat)
            formItems.append(formItem)
        }
        return formItems
    }
    
    let formItems = createFormItems(from: questions)
    
    formStep.formItems = formItems
    steps.append(formStep)
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}

struct SurveyViewController: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = context.coordinator
        return taskViewController
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {}
    
    class Coordinator: NSObject, ORKTaskViewControllerDelegate {
        var parent: SurveyViewController
        
        init(_ parent: SurveyViewController) {
            self.parent = parent
        }
        
        func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskFinishReason, error: Error?) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SurveyView1: View {
    @State private var showSurvey = false   // 서베이 띄우기 변수
    @Binding var showModal: Bool            // 모달띄우기 변수

    var body: some View {
        VStack {
            Text("Health Survey")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                showSurvey = true
            }) {
                Text("Start Survey")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .sheet(isPresented: $showSurvey) {
            SurveyViewController()
        }
    }
}


#Preview {
    SurveyView1(showModal: .constant(true))
}
