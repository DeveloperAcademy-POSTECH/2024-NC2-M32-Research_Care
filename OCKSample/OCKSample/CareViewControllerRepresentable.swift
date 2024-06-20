import SwiftUI
import Foundation

struct CareViewControllerRepresentable: UIViewControllerRepresentable {
    
    // 필요한 매개변수를 생성자에 추가합니다.
    
    func makeUIViewController(context: Context) -> CareViewController {
        // CareViewController를 storeManager와 함께 초기화합니다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manager = appDelegate.synchronizedStoreManager
        
        let viewController = CareViewController(storeManager: manager)
        return viewController
    }

    func updateUIViewController(_ uiViewController: CareViewController, context: Context) {
        // 필요에 따라 ViewController를 업데이트합니다.
    }
}
