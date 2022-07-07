//
//  ViewController.swift
//  VIP-Swift-Structure
//
//  Created by Luccas Santana Marinho on 05/07/22.
//

import UIKit

protocol ViewControllerLogic: AnyObject {
    func displayHelloWorld()
}

class ViewController: UIViewController, ViewControllerLogic {
    var interactor: InteractorLogic?
    var router: ViewControllerRouter!
    var identifier = ViewController.description()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .link
        router = ViewControllerRouter(viewController: self)
        setupConstraints()
        
        displayHelloWorld()
        interactor?.fetchHelloWorld()
    }
    
    func insertViews() {
        self.view.addSubview(lbl)
        self.view.addSubview(lbl2)
        self.view.addSubview(button)
    }
    
    func setupConstraints() {
        insertViews()
        
        NSLayoutConstraint.activate([
            lbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            lbl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50),
            
            lbl2.topAnchor.constraint(equalTo: self.lbl.bottomAnchor, constant: 20),
            lbl2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.topAnchor.constraint(equalTo: self.lbl2.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

        ])
    }
    
    private lazy var lbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var lbl2: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.backgroundColor = .orange
          button.setTitle("Próxima tela", for: .normal)
          button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    func displayHelloWorld() {
        lbl.text = "Teste VIP!"
        lbl2.text = "Deu certo!"
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let another = AnotherViewController()
        router?.navigateToPushedViewController(source: self, destination: another)
    }
}
