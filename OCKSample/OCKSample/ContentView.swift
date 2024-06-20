import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UITabBarAppearance()
        
        // 사용자 정의 색상 설정
        let customColor = UIColor(red: 52/255, green: 120/255, blue: 246/255, alpha: 1.0)// #EB6A64 색상
        let backgroundColor = UIColor.white // 원하는 배경색으로 변경
        
        // 선택된 아이템 색상 설정
        appearance.stackedLayoutAppearance.selected.iconColor = customColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: customColor]
        
        // 배경색 설정
        appearance.backgroundColor = backgroundColor
        
        // 탭 바의 기본 appearance 설정
        UITabBar.appearance().standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        // 기본 tintColor를 앱 전체에 설정 (필요에 따라 조정)
        UITabBar.appearance().tintColor = customColor
        UINavigationBar.appearance().tintColor = customColor
    }
    
    var body: some View {
        TabView {
            CareViewControllerRepresentable()
                .tabItem {
                    Image(systemName: "stethoscope")
                    Text("Care")
                }
            ResearchView()
                .tabItem {
                    Image(systemName: "doc.text.magnifyingglass")
                    Text("Research")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
