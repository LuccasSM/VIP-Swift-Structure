//
//  Interactor.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import Foundation

protocol InteractorLogic {
    func fetchHelloWorld()
}

class Interactor: InteractorLogic {
    var presenter: PresenterLogic?
    
    init(presenter: PresenterLogic) {
        self.presenter = presenter
    }
    
    func fetchHelloWorld() {
        presenter?.presenterHelloWorld()
    }
}
