//
//  Configurator.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import Foundation
import UIKit

struct ConfiguratorViewController {
    static func config() -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor(presenter: presenter)
        let router = ViewControllerRouter()
        let view = ViewController(interactor: interactor, router: router)
        
        presenter.vc = view
        router.viewController = view
        
        return view
    }
}
