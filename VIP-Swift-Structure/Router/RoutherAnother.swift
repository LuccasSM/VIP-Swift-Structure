//
//  RoutherAnother.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 08/07/22.
//

import Foundation
import UIKit

protocol AnotherDestinationProtocol {}

enum AnotherRoutingDestination: AnotherDestinationProtocol {
   case another
}

protocol RouterProtocolAnother {
   associatedtype RoutingDestinationAnother: AnotherDestinationProtocol
   func route(to destination: RoutingDestinationAnother)
}

final class AnotherControllerRouter: RouterProtocolAnother {
    weak var another: AnotherViewController?
    
    typealias RoutingDestinationAnother = AnotherRoutingDestination
    
    func route(to destination: RoutingDestinationAnother) {
        switch destination {
        case .another:
            print("tela another")
        }
    }
    
    init(another: AnotherViewController) {
        self.another = another
    }

    // MARK: ViewControllerRouterInput

    func navigateToPushedMyView(source: UIViewController) {
        let vc = UINavigationController(rootViewController: MyView())
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.another?.present(vc, animated: true)
    }
}
