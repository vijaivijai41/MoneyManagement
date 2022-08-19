//
//  MMEmiCalculatorCoordinator.swift
//  MoneyFlow
//
//  Created by vijay kumar on 19/08/22.
//

import Foundation
import UIKit

class MMEmiCalculatorCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = MMEmiCalculatorViewController.instantiate(from: MMStoryBoardName.emiCalculator.rawValue)
        self.navigationController.tabBarItem = UITabBarItem(title: "Emi", image: UIImage(named: "emi-calculator"), tag: 0)
        self.navigationController.pushViewController(controller, animated: true)
    }
}
