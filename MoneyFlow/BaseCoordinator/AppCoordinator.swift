//
//  AppCoordinator.swift
//  MoneyFlow
//
//  Created by vijay kumar on 19/08/22.
//

import Foundation
import UIKit


class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
   
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var emiNavigationController: UINavigationController = UINavigationController()
    var expenseNavigationController: UINavigationController = UINavigationController()
    var taskNavigationController: UINavigationController = UINavigationController()
    var moreNavigationController: UINavigationController = UINavigationController()
    
    func start() {
        //Emi calculator
        let emiCoordinator = MMEmiCalculatorCoordinator(navigationController: emiNavigationController)
        self.addChilCoordinator(coordinator: emiCoordinator)
        emiCoordinator.start()
        
        //Expense manager
        let expenseManagerCoordinator = MMExpenseManagerCoordinator(navigationController: expenseNavigationController)
        self.addChilCoordinator(coordinator: expenseManagerCoordinator)
        expenseManagerCoordinator.start()
        
        //TaskManager
        let taskManagerCoordinator = MMTaskManagerCoordinator(navigationController: taskNavigationController)
        self.addChilCoordinator(coordinator: taskManagerCoordinator)
        taskManagerCoordinator.start()
        
        let baseTabBarController = MMBaseTabBarController.instantiate(from: MMStoryBoardName.base.rawValue)
        baseTabBarController.viewControllers = [emiNavigationController, expenseNavigationController, taskNavigationController]
        
        self.navigationController.pushViewController(baseTabBarController, animated: true)
    }
    
}
