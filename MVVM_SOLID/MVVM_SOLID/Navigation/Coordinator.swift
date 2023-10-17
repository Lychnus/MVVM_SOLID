//
//  Coordinator.swift
//  MVVM_SOLID
//
//  Created by Tahir Anil Oghan on 17.10.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var didFinish: ((Coordinator) -> Void)? { get set }
    var childCoordinators: [Coordinator] { get set }
    var rootViewController: UIViewController { get }
    
    func start()
    func addChild(coordinator: Coordinator)
    func removeChild(coordinator: Coordinator)
}

extension Coordinator {
    func addChild(coordinator: Coordinator) {
        let isCoordinatorPresent = childCoordinators.contains(where: { $0 === coordinator })
        if isCoordinatorPresent == false {
            coordinator.didFinish = { [weak self] coordinator in
                self?.removeChild(coordinator: coordinator)
            }
            childCoordinators.append(coordinator)
            coordinator.start()
        }
    }
    
    func removeChild(coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
