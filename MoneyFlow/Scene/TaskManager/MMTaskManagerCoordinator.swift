//
//  MMTaskManagerCoordinator.swift
//  MoneyFlow
//
//  Created by vijay kumar on 19/08/22.
//

import Foundation
import UIKit

class MMTaskManagerCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = MMTaskManagerViewController.instantiate(from: MMStoryBoardName.taskManager.rawValue)
        self.navigationController.tabBarItem = UITabBarItem(title: "Task", image: UIImage(named: "task"), tag: 2)

        self.navigationController.pushViewController(controller, animated: true)
    }
}
