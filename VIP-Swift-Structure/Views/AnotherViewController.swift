//
//  AnotherViewController.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import Foundation
import UIKit

protocol AnotherViewControllerLogic: AnyObject {
    func displayAnotherInfo()
}

protocol AnotherViewDelegate {
    func configureData(_ data: String)
}

class AnotherViewController: UIViewController, AnotherViewControllerLogic {
    
    var interactor: AnotherViewInteractorLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        setupConstraints()
        
        displayAnotherInfo()
        interactor?.fetchHelloWorld()
    }
    
    func insertViews() {
        self.view.addSubview(lbl)
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
        lbl.text = "Segunda tela"
        lbl.font.withSize(30)
    }
    
    func configureData(_ data: String) {
        lbl.text = data
    }
}
