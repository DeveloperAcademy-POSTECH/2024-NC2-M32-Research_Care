# 2024-NC2-M32-ResearchKit & CareKit
## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## 💡 About Augmented Reality
>ResearchKit은 2015년, CareKit은 2016년에 처음 릴리즈 된, Apple에서 제공하는 Health분야의 open-source 프레임워크들입니다.
<br/>
<br/>ResearchKit은 medical research 목적으로 제작되었습니다.
<br/>설문지 수행, 동의서 작성, 피트니스 센싱, 인지게임, 터치게임 등을 실시할 수 있는 기능들을 제공합니다.
<br/>
<br/>CareKit은 환자의 건강관리를 목적으로 제작되었습니다.
<br/>증상 기록, 투약 기록 관리, 시각화 차트 및 건강기록 공유 기능들을 지원합니다.

## 🎯 What we focus on?
> ResearchKit과 CareKit은 접근 난이도가 있는 편입니다.<br/>-UIKit베이스로 작성되어있고<br/>-기존에 사용사례(샘플코드)가 적어서 접근이 어려웠습니다. 따라서 저희의 전략은,<br/>(1)우선 Kit으로 단일기능을 구현해보자<br/>(2)구현된 기능에서 Minor한 Modify를 가능케하자<br/>였습니다.

## 💼 Use Case
> 실제 사용이 필요한 대상자는, 공황장애 환자로 설정하였습니다.<br/>그리고, 아래의 네 가지 경우를 목표로 앱을 만들어보았습니다.
<br/>(1)공황장애 환자가 공황증상을 자가진단하는 설문지를 제작하기 [ResearchKit]
<br/>(2)공황환자가 심호흡이나 운동을 하는 횟수 관리하기 [CareKit]
<br/>(3)공황환자가 주기적으로 약을 챙겨먹을 수 있도록 체크하기 [CareKit]
<br/>(4)공황환자의 의료기록들을 의사에게 보여줄 수 있도록 정리하기 [CareKit]

## 🖼️ Prototype
>위의 Use Case에서 목표로 한 것과 비슷합니다.
<br/>(1)공황환자용 설문지를 제작하였고 결과 차트 구현되었습니다.
<br/>(2)공황환자를 위한 심호흡이나 운동횟수 관리하는 기능 구현되었습니다.
<br/>(3)공황환자가 주기적으로 약을 챙겨먹게 하는 기능 구현되었습니다.
<br/>(4)1,2,3 기능은 자동으로 저장되어, 필요시 의사선생님과 상담용으로 사용될 수 있을 것입니다.
<br/>--> 날짜별 저장기능은 따로 구현되기 이전이며, ResearchKit, CareKit 자체기능에 의한 오늘날짜 기록만 구현되었습니다.


## 🛠️ About Code
>(1)혹시 다른 프로젝트로 코드 이식시에는, 메인 Project 하위에 'ResearchKit.xcodeproj', 'CareKit.xcodeproj'을 추가하여야 합니다.
<br/>(FrameWork로 제공되는 Open-source가 구동하기 위한 조건입니다.)
<br/>- 메인 Project의 Target부분에 해당하는 곳으로 찾아가서, Framework를 각각 수동으로 추가해주어야 합니다.
<br/>--> ResearchKit의 경우: ResearchKit, ResearchKitUI
<br/>--> CareKit의 경우: CareKit, CareKitStore, CareKitUI
<br/>(2)구동에 문제가 있을 경우, 권장 iOS버전으로 설정하여 구동하여주시기 바랍니다.
<br/>- 현재 git에 저장된 코드는 iOS 13.0기준으로 설정되어있습니다.
