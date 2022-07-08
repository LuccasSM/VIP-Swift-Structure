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
    private let interactor: InteractorLogic
    private let router: ViewControllerRouter
    
    init(interactor: InteractorLogic, router: ViewControllerRouter) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .link
        setupConstraints()
    }
    
    func insertViews() {
        self.view.addSubview(lbl)
        self.view.addSubview(lbl2)
        self.view.addSubview(button)
        self.view.addSubview(buttonTwo)
        
        displayHelloWorld()
        interactor.fetchHelloWorld()
    }
    
    func setupConstraints() {
        insertViews()
        
        NSLayoutConstraint.activate([
            lbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            lbl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),
            
            lbl2.topAnchor.constraint(equalTo: self.lbl.bottomAnchor, constant: 20),
            lbl2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.topAnchor.constraint(equalTo: self.lbl2.bottomAnchor, constant: 20),
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
        button.setTitle("Segunda tela", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        button.setTitle("Terceira tela", for: .normal)
        button.addTarget(self, action: #selector(navigateMyView), for: .touchUpInside)
        return button
    }()
    
    func displayHelloWorld() {
        lbl.text = "Teste VIP!"
        lbl2.text = "Deu certo!"
    }
    
    @objc func buttonAction(sender: UIButton!) {
        router.navigateToPushedViewController(source: self)
    }
    
    @objc func navigateMyView(sender: UIButton!) {
        router.navigateToPushedThreeView(source: self)
    }
}
