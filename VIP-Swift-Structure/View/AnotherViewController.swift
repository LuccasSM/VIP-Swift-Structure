//
//  AnotherViewController.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 07/07/22.
//

import UIKit

protocol AnotherViewControllerLogic: AnyObject {
    func displayAnotherInfo()
}

class AnotherViewController: UIViewController, AnotherViewControllerLogic {
    var interactor: AnotherViewInteractorLogic?
    var router: AnotherControllerRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        setupConstraints()
    }
    
    func insertViews() {
        self.view.addSubview(lbl)
        self.view.addSubview(button)
        self.view.addSubview(buttonTwo)
        
        interactor?.fetchHelloWorld()
        displayAnotherInfo()
    }
    
    func setupConstraints() {
        insertViews()
        
        NSLayoutConstraint.activate([
            lbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            lbl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),
            
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.topAnchor.constraint(equalTo: self.lbl.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            buttonTwo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),
            buttonTwo.heightAnchor.constraint(equalToConstant: 60),
            buttonTwo.topAnchor.constraint(equalTo: self.button.bottomAnchor, constant: 20),
            buttonTwo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    
    private lazy var lbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .blue
        return lbl
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemYellow
        button.setTitle("Voltar", for: .normal)
        button.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.setTitle("Terceira tela", for: .normal)
        button.addTarget(self, action: #selector(navigateMyView), for: .touchUpInside)
        return button
    }()
    
    func displayAnotherInfo() {
        lbl.text = "Segunda tela"
        lbl.font.withSize(30)
    }
    
    @objc func dismissPage(dismiss: UIButton!) {
        self.dismiss(animated: true)
    }
    
    @objc func navigateMyView(sender: UIButton!) {
        router?.navigateToPushedMyView(source: self)
    }
}
