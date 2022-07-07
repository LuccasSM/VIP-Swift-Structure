//
//  RouterController.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import Foundation
import UIKit

protocol RoutingDestinationProtocol {}

enum ChatRoutingDestination: RoutingDestinationProtocol {
   case viewChat(userId: String)
   case startNewChat
}

protocol RouterProtocol {
   associatedtype RoutingDestination: RoutingDestinationProtocol
   func route(to destination: RoutingDestination)
}

final class ViewControllerRouter: RouterProtocol {
    weak var viewController: ViewController?
    weak var anotherView: AnotherViewController?
    
    typealias RoutingDestination = ChatRoutingDestination
    
    func route(to destination: RoutingDestination) {
        switch destination {
        case .startNewChat:
            print("uma tela")
        case .viewChat(userId: _):
            print("outra tela")
        }
    }
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }

    // MARK: ViewControllerRouterInput

    func navigateToPushedViewController(source: UIViewController,  destination: UIViewController) {
        self.viewController?.dismiss(animated: true)
        self.viewController?.present(destination, animated: true)
    }
}
