//
//  StoryBoarded.swift
//  MoneyFlow
//
//  Created by vijay kumar on 19/08/22.
//

import Foundation
import UIKit

protocol StoryBoarded {
    static func instantiate() -> Self
}

extension StoryBoarded where Self: UIViewController {
    static func instantiate() -> Self {
        let storyBoardName = String(describing: self)
        return instantiate(from: storyBoardName)
    }
    
    static func instantiate(from storyboardName: String) -> Self {
        let className = String(describing: self)
        let bundleName = Bundle(for: Self.self)
        let storyBoard = UIStoryboard(name: storyboardName, bundle: bundleName)
        return storyBoard.instantiateViewController(withIdentifier: className) as! Self
    }
}
