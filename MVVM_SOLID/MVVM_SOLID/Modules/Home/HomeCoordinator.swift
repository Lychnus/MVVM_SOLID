//
//  HomeCoordinator.swift
//  MVVM_SOLID
//
//  Created by Tahir Anil Oghan on 17.10.2023.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    //MARK: Properties
    var didFinish: ((Coordinator) -> Void)?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController {
        return navigationController
    }
    private let navigationController = UINavigationController()
    
    //MARK: Start
    func start() {
        showHome()
    }
    
    //MARK: Helper Functions
    private func showHome() {
        let viewModel = HomeViewModelImplementation()
        let view = HomeViewImplementation()
        let viewController = HomeViewController(customView: view, viewModel: viewModel)
        
        viewController.completeNavigation = { [weak self] in
            self?.completeNavigation()
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func completeNavigation() {
        didFinish?(self)
    }
}
