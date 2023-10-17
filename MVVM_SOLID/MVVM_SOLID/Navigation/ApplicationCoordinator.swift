//
//  ApplicationCoordinator.swift
//  MVVM_SOLID
//
//  Created by Tahir Anil Oghan on 17.10.2023.
//

import UIKit

final class ApplicationCoordinator {
    
    private var window: UIWindow
    private var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //TODO: Make lauch configurator to select coordinator.
        self.initializeHomeCoordinator()
        self.window.makeKeyAndVisible()
    }
    
    private func addChild(coordinator: Coordinator) {
        let isCoordinatorPresent = childCoordinators.contains(where: { $0 === coordinator })
        if isCoordinatorPresent == false {
            self.childCoordinators.append(coordinator)
            coordinator.start()
        }
    }
    
    private func removeChild(coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    private func initializeHomeCoordinator() {
        let coordinator = HomeCoordinator()
        coordinator.didFinish = { [weak self] finishedCoordinator in
            self?.removeChild(coordinator: finishedCoordinator)
        }
        self.addChild(coordinator: coordinator)
        self.window.rootViewController = coordinator.rootViewController
    }
}
