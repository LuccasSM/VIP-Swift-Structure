//
//  MyViewInteractor.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 08/07/22.
//

import Foundation

protocol MyViewInteractorLogic {
    func fetchHelloWorld()
}

class MyViewInteractor: MyViewInteractorLogic {
    var presenter: MyViewPresenterLogic?
    
    init(presenter: MyViewPresenterLogic) {
        self.presenter = presenter
    }
    
    func fetchHelloWorld() {
        presenter?.presenterHelloWorld()
    }
}
