//
//  AnotherViewInteractor.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import Foundation

protocol AnotherViewInteractorLogic {
    func fetchHelloWorld()
}

class AnotherViewInteractor: AnotherViewInteractorLogic {
    var presenter: AnotherViewPresenterLogic?
    
    init(presenter: AnotherViewPresenterLogic) {
        self.presenter = presenter
    }
    
    func fetchHelloWorld() {
        presenter?.presenterHelloWorld()
    }
}
