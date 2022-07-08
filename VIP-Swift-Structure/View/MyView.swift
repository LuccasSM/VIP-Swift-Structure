//
//  MyView.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import UIKit

protocol MyViewControllerLogic: AnyObject {
    func displayAnotherInfo()
}

class MyView: UIViewController, MyViewControllerLogic {
    var interactor: InteractorLogic?
    var router: ViewControllerRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        setupConstraints()
    }
    
    func insertViews() {
        self.view.addSubview(lbl)
        
        displayAnotherInfo()
        interactor?.fetchHelloWorld()
    }
    
    func setupConstraints() {
        insertViews()
        
        NSLayoutConstraint.activate([
            lbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            lbl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    private lazy var lbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .blue
        return lbl
    }()
    
    func displayAnotherInfo() {
        lbl.text = "Minha MyView (Terceira view)"
        lbl.font.withSize(30)
    }
}
