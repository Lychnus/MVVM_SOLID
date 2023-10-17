//
//  HomeViewController.swift
//  MVVM_SOLID
//
//  Created by Tahir Anil Oghan on 17.10.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Navigation
    var completeNavigation: (() -> Void)?

    //MARK: Properties
    private let customView: HomeView
    private var viewModel: HomeViewModel
    
    //MARK: Initialization
    init(customView: HomeView, viewModel: HomeViewModel) {
        self.customView = customView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitials()
    }
    
    //MARK: Private Helper Functions
    private func setupCustomView() {
        view.backgroundColor = .white
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupInitials() {
        viewModel.delegate = self
        customView.delegate = self
        setupCustomView()
    }
    
}

//MARK: ViewModel Delegate Implementation
extension HomeViewController: HomeViewModelDelegate {
    func didEmailValidation(result: EmailValidationStatuss) {
        switch result {
        case .valid:
            customView.respondEmailValidation(isValid: true)
        case .unvalid:
            customView.respondEmailValidation(isValid: false)
        }
    }
}

//MARK: View Delegate Implementation
extension HomeViewController: HomeViewDelegate {
    func requestEmailValidation(for email: String) {
        viewModel.email = email
    }
}

