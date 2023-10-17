//
//  HomeViewModel.swift
//  MVVM_SOLID
//
//  Created by Tahir Anil Oghan on 17.10.2023.
//

import Foundation

//MARK: ViewModel Interface
protocol HomeViewModel {
    var delegate: HomeViewModelDelegate? { get set }
    var email: String { get set }
}

//MARK: ViewModel Delegate Interface
protocol HomeViewModelDelegate: AnyObject {
    func didEmailValidation(result: EmailValidationStatuss)
}

//MARK: ViewModel Implementation
class HomeViewModelImplementation: HomeViewModel {

    //MARK: Properties
    weak var delegate: HomeViewModelDelegate? = nil
    var email: String = String() {
        didSet {
            self.validateEmail()
        }
    }
    
    private let emailRegex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
    
    //MARK: Private Helper Functions
    ///Validation is only for making textfield red or not.
    private func validateEmail() {
        if email.isEmpty {
            self.delegate?.didEmailValidation(result: .valid)
            return
        }
        
        let result = self.email.validate(regex: emailRegex)
        switch result {
        case true:
            self.delegate?.didEmailValidation(result: .valid)
        case false:
            self.delegate?.didEmailValidation(result: .unvalid)
        }
    }
}

//MARK: Helper Constants
enum EmailValidationStatuss {
    case valid, unvalid
}
