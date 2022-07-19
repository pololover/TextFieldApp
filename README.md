
<h1 align="center">델리게이트 패턴 학습 앱 ✏️</h1>

## 앱 소개  📲
- 텍스트필드를 이용해서 입력검증을 어떻게 구성하는지 탐구하는 앱

## 앱 작동
<img width="300px" height="600px" src="https://user-images.githubusercontent.com/70146658/179742479-07874977-d1fe-48bd-b995-50a4a8d1820e.gif"/>

## 델리게이트 패턴 🔁
델리게이트는 대리자라는 뜻으로 어떠한 행위에 대해서 대신 처리하는 역할을 한다. 이는 애플이 개발자들이 앱을 구현하는데 **편의성**을 주기위한 패턴이다. 

### 델리게이트 프로토콜
델리게이트 패턴은 프로토콜을 이용해서 만든 패턴이다. 애플이 미리 정의해놓은 여러 반응객체가 존재하는데 이러한 반응객체들에 대해서 프로토콜을 **미리**정의해두어 프로토콜을 상속받은 곳에서 구체화해서 사용하는 것이 특징이다.           

### 델리게이트 구현
```swift
// 프로토콜 정의
protocol RemoteControlProtocol {
  func changeUp()
  func changeDown()
}

class RemoteControl {
  var delegate: RemoteControlDelegate? // 해당 프로토콜을 채택한 타입만 대리자로 설정가능
  
  func changeUp() {
    delegate?.changeUp()
  }
  
  func changeDown() {
    delegate?.changeDown()
  }
}

// 프로토콜 채택
class TV: remoteControl {
  
  func changeUp() {
    print("채널 위로")
  }
  
  func changeDown() {
    print("채널 아래로")
  }

}
var remote = RemoteControl()
var tv1 = TV()
remote.delegate = tv1
```

### 코드 설명
- RemoteControl은 직접 사용자와 상호작용하는 객체로 위 앱의 텍스트필드에 해당한다
- TV는 리모콘의 동작을 통해서 직접 어떠한 액션을 취하는 객체이며 위 앱의 viewController에 해당한다.

## 델리게이트를 왜 사용할까 ？
- 개발자들의 편의성을 위해 제공. 미리 구현되어 있지않다면 앱의 모든 세부동작을 직접구현해야함.
- 디테일한 동작이나 시점에 대해 구체적인 정의가능
- 재사용되어 사용되기에 같은분류의 응답객체에대해 여러 구체화된 로직설계 가능(다형성)




