//
//  RouterController.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import Foundation
import UIKit

protocol RoutingDestinationProtocol {}

enum VcRoutingDestination: RoutingDestinationProtocol {
   case viewController
}

protocol RouterProtocol {
   associatedtype RoutingDestination: RoutingDestinationProtocol
   func route(to destination: RoutingDestination)
}

final class ViewControllerRouter: RouterProtocol {
    weak var viewController: ViewController?
    
    typealias RoutingDestination = VcRoutingDestination
    
    func route(to destination: RoutingDestination) {
        switch destination {
        case .viewController:
            print("tela viewController")
        }
    }
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }

    // MARK: ViewControllerRouterInput

    func navigateToPushedViewController(source: UIViewController) {
        let vc = UINavigationController(rootViewController: AnotherViewController())
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.viewController?.present(vc, animated: true)
    }
    
    func navigateToPushedThreeView(source: UIViewController) {
        self.viewController?.present(MyView(), animated: true)
    }
}
