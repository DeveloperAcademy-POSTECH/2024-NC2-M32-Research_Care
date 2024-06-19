import CareKit
import Contacts
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Manages synchronization of a CoreData store
    lazy var synchronizedStoreManager: OCKSynchronizedStoreManager = {
        let store = OCKStore(name: "SampleAppStore")
        store.populateSampleData()
        let manager = OCKSynchronizedStoreManager(wrapping: store)
        return manager
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

private extension OCKStore {

    // Adds tasks and contacts into the store
    func populateSampleData() {

        let thisMorning = Calendar.current.startOfDay(for: Date())
        let aFewDaysAgo = Calendar.current.date(byAdding: .day, value: -4, to: thisMorning)!
        let beforeBreakfast = Calendar.current.date(byAdding: .hour, value: 8, to: aFewDaysAgo)!
        let afterLunch = Calendar.current.date(byAdding: .hour, value: 14, to: aFewDaysAgo)!

        let schedule = OCKSchedule(composing: [
            OCKScheduleElement(start: beforeBreakfast, end: nil,
                               interval: DateComponents(day: 1)),

            OCKScheduleElement(start: afterLunch, end: nil,
                               interval: DateComponents(day: 1))
        ])

        var doxylamine = OCKTask(id: "doxylamine", title: "약 복용",
                             carePlanID: nil, schedule: schedule)
        doxylamine.instructions = "공황 발작을 겪을 때 약을 복용하세요"

        let nauseaSchedule = OCKSchedule(composing: [
            OCKScheduleElement(start: beforeBreakfast, end: nil, interval: DateComponents(day: 1),
                               text: "하루 중 언제든지", targetValues: [], duration: .allDay)
            ])

        var nausea = OCKTask(id: "nausea", title: "공황 발작 추적",
                             carePlanID: nil, schedule: nauseaSchedule)
        nausea.impactsAdherence = false
        nausea.instructions = "공황 발작을 겪을 때마다 아래 버튼을 누르세요"

        let kegelSchedule = OCKSchedule(composing: [OCKScheduleElement(start: beforeBreakfast, end: nil, interval: DateComponents(day: 1))])
        var kegels = OCKTask(id: "kegels", title: "호흡 명상", carePlanID: nil, schedule: kegelSchedule)
        kegels.impactsAdherence = true
        kegels.instructions = "호흡 명상을 수행하세요"

        addTasks([nausea, doxylamine, kegels], callbackQueue: .main, completion: nil)

        var contact1 = OCKContact(id: "jane", givenName: "혁진",
                                  familyName: "윤", carePlanID: nil)
        contact1.asset = "윤혁진"
        contact1.title = "정신과"
        contact1.role = "정신과 의사로 8년간 근무"
        contact1.emailAddresses = [OCKLabeledValue(label: CNLabelEmailiCloud, value: "yoon@icloud.com")]
        contact1.phoneNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(010) 555-5555")]
        contact1.messagingNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(010) 555-7415")]

        contact1.address = {
            let address = OCKPostalAddress()
            address.street = "강남대로 428"
            address.city = "서울"
            address.state = "한국"
            address.postalCode = "0000"
            return address
        }()

        var contact2 = OCKContact(id: "matthew", givenName: "동인",
                                  familyName: "강", carePlanID: nil)
        contact2.asset = "강동인"
        contact2.title = "정신과"
        contact2.role = "정신과 의사로 13년간 근무"
        contact2.phoneNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(010) 333-3333")]
        contact2.messagingNumbers = [OCKLabeledValue(label: CNLabelWork, value: "(010) 333-3333")]
        contact2.address = {
            let address = OCKPostalAddress()
            address.street = "강남대로 357"
            address.city = "서울"
            address.state = "한국"
            address.postalCode = "0000"
            return address
        }()

        addContacts([contact1, contact2])
    }
}
