//
//  HomeView.swift
//  MVVM_SOLID
//
//  Created by Tahir Anil Oghan on 17.10.2023.
//

import UIKit

//MARK: View Interface
protocol HomeView: UIView {
    var delegate: HomeViewDelegate? { get set }
    func respondEmailValidation(isValid: Bool)
}

//MARK: View Delegate Interface
protocol HomeViewDelegate: AnyObject {
    func requestEmailValidation(for email: String)
}

//MARK: View Implementation
class HomeViewImplementation: UIView, HomeView {
    
    //MARK: UI Elements
    private lazy var emailTextField: UITextField = {
        let element = UITextField()
        element.borderStyle = .roundedRect
        element.placeholder = "Email@example.com"
        return element
    }()
    
    private lazy var passwordTextField: UITextField = {
        let element = UITextField()
        element.borderStyle = .roundedRect
        element.placeholder = "Password"
        return element
    }()
    
    //MARK: Properties
    weak var delegate: HomeViewDelegate? = nil
    
    //MARK: Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitials()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Helper Functions
    private func setupInitials() {
        self.backgroundColor = .white
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setupConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 240).isActive = true
    }
    
    func respondEmailValidation(isValid: Bool) {
        switch isValid {
        case true:
            emailTextField.backgroundColor = .systemBackground
        case false:
            emailTextField.backgroundColor = .red
        }
    }
}

//MARK: TextField Delegate Implementation
extension HomeViewImplementation: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField === emailTextField {
            let email = textField.text ?? ""
            delegate?.requestEmailValidation(for: email)
        }
    }
}
