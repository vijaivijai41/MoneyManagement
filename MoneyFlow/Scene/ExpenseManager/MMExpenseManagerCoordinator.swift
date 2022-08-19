//
//  MMExpenseManagerCoordinator.swift
//  MoneyFlow
//
//  Created by vijay kumar on 19/08/22.
//

import Foundation
import UIKit

class MMExpenseManagerCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = MMExpenseManagerViewController.instantiate(from: MMStoryBoardName.expenseManager.rawValue)
        self.navigationController.tabBarItem = UITabBarItem(title: "Expense", image: UIImage(named: "expense"), tag: 1)

        self.navigationController.pushViewController(controller, animated: true)
    }
}
