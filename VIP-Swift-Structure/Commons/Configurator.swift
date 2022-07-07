//
//  Configurator.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import Foundation
import UIKit

class Configurator {
    func config() -> UIViewController {
        let vc = ViewController()
        let presenter = Presenter(vc: vc)
        let interactor = Interactor(presenter: presenter)
        
        vc.interactor = interactor
        
        return vc
    }
}
