//
//  ConfiguratorAnother.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 08/07/22.
//

import Foundation
import UIKit

struct ConfiguratorAnother {
    static func config() -> UIViewController {
        let presenter = AnotherViewPresenter()
        let interactor = AnotherViewInteractor(presenter: presenter)
        let router = AnotherControllerRouter()
        let view = AnotherViewController(interactor: interactor, router: router)
        
        presenter.vc = view
        router.another = view
        
        return view
    }
}
