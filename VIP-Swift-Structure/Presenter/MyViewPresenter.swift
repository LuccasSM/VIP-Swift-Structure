//
//  MyViewPresenter.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 08/07/22.
//

import Foundation

protocol MyViewPresenterLogic {
    func presenterHelloWorld()
}

class MyViewPresenter: MyViewPresenterLogic {
    weak var vc: MyViewControllerLogic?
    
    init(vc: MyViewControllerLogic) {
        self.vc = vc
    }
    
    func presenterHelloWorld() {
        vc?.displayAnotherInfo()
    }
}
