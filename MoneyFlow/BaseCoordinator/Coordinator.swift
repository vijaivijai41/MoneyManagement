//
//  Coordinator.swift
//  MoneyFlow
//
//  Created by vijay kumar on 19/08/22.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    init(navigationController: UINavigationController)
    func start()
}


extension Coordinator {
    func addChilCoordinator(coordinator: Coordinator) {
        if !childCoordinators.contains(where: { $0 === coordinator}) {
            childCoordinators.append(coordinator)
        }
    }
    func removeCoordinator(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0 !== coordinator})
    }
}
