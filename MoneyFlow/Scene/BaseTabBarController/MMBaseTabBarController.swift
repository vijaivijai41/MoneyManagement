//
//  MMBaseTabBarController.swift
//  MoneyFlow
//
//  Created by vijay kumar on 19/08/22.
//

import UIKit

class MMBaseTabBarController: UITabBarController, StoryBoarded {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.tabBar.backgroundColor = .clear
        // Do any additional setup after loading the view.
    }
}


//MARK: - MMTabbar
public final class MMTabbar: UITabBar {
    var color: UIColor = .white
    var radii: CGFloat = 30.0
    private var shapeLayer: CALayer?

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        addRoundedShape()
        self.backgroundColor = .white

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .medium)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .regular)], for: .selected)
    }

    private func addRoundedShape() {
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        shapeLayer.fillColor = color.cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.shadowColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: 2);
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }
    
    public override func awakeFromNib() {
        self.unselectedItemTintColor = UIColor.gray
        self.tintColor = Color.secondaryColor
        self.isTranslucent = false
        self.barStyle = .default
    }

    // create circle path for top
    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radii, height: 0.0))
        return path.cgPath
    }
   
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        let tabFrame = self.frame
        self.layer.cornerRadius = 30
        self.frame  = tabFrame
    }
}
