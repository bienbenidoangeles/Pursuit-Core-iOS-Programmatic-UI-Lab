//
//  MainView.swift
//  Pursuit-Core-iOS-Programmatic-UI-Lab
//
//  Created by Bienbenido Angeles on 1/28/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    

    public lazy var randomColorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    public lazy var redButton: UIButton = {
        let redButton = UIButton()
        redButton.backgroundColor = .red
        redButton.tag = 0
        return redButton
    }()
    
    public lazy var greenButton: UIButton = {
        let greenButton = UIButton()
        greenButton.backgroundColor = .green
        greenButton.tag = 1
        return greenButton
    }()
    
    public lazy var blueButton: UIButton = {
        let blueButton = UIButton()
        blueButton.backgroundColor = .blue
        blueButton.tag = 2
        return blueButton
    }()
    
    public lazy var buttons: [UIButton] = {
        let buttons = [redButton, greenButton, blueButton]
        return buttons
    }()

    public lazy var stackView: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    public lazy var userFeedBackLabel: UILabel = {
        let label = UILabel()
        label.text = "Unknown guess. Your score is 0 and your highest score is 0."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    public lazy var newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private func commonInit(){
        setupViewConstrainsts()
        setupStackViewConstrainsts()
        setupLabelConstrainsts()
        setUpResetGameConstrainsts()
    }
    
    private func setupViewConstrainsts(){
        addSubview(randomColorView)
        randomColorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            randomColorView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            randomColorView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            randomColorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            randomColorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setupStackViewConstrainsts(){
        addSubview(stackView)
        let views = [redButton, greenButton, blueButton]
        
        for view in views{
            stackView.addArrangedSubview(view)
        }
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 20.0
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: randomColorView.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: randomColorView.bottomAnchor, constant: 20),
            //stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            //stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            stackView.widthAnchor.constraint(equalTo: randomColorView.widthAnchor, multiplier: 1),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func setupLabelConstrainsts(){
        addSubview(userFeedBackLabel)
        userFeedBackLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userFeedBackLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            userFeedBackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            userFeedBackLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setUpResetGameConstrainsts(){
        addSubview(newGameButton)
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newGameButton.centerXAnchor.constraint(equalTo: userFeedBackLabel.centerXAnchor),
            newGameButton.topAnchor.constraint(equalTo: userFeedBackLabel.bottomAnchor, constant: 20)
        ])
    }
}
