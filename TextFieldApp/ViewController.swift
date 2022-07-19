//
//  ViewController.swift
//  TextFieldApp
//
//  Created by 천승현 on 2022/07/19.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        setup()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.placeholder = "이메일 입력"
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder()
    }
    
    // 텍스트 입력을 시작할때 (시작할지 말지)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트 입력할 때 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    // 텍스트를 지울지 말지
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 한글자씩 입력받을 때 실행하는 함수 (입력받을지 말지)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        if Int(string) != nil {
            return false
        } else {
            guard let text = textField.text else{ return false}
            let newCount = text.count + string.count - range.length
            return newCount <= 10
        }
    }
    
    // 리턴 버튼클릭시 리턴할지 말지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트 입력을 끝낼 때 호출(끝낼지 말지)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }

    // 텍스트필드가 실제 끝났을 때의 시점
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
}

