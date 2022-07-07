//
//  AnotherViewPresenter.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import Foundation

protocol AnotherViewPresenterLogic {
    func presenterHelloWorld()
}

class AnotherViewPresenter: AnotherViewPresenterLogic {
    weak var vc: AnotherViewControllerLogic?
    
    init(vc: AnotherViewControllerLogic) {
        self.vc = vc
    }
    
    func presenterHelloWorld() {
        vc?.displayAnotherInfo()
    }
}
