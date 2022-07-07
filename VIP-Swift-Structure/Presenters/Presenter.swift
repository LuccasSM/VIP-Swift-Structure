//
//  Presenter.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import Foundation

protocol PresenterLogic {
    func presenterHelloWorld()
}

class Presenter: PresenterLogic {
    weak var vc: ViewControllerLogic?
    
    init(vc: ViewControllerLogic) {
        self.vc = vc
    }
    
    func presenterHelloWorld() {
        vc?.displayHelloWorld()
    }
}
