//
//  ViewController.swift
//  Pursuit-Core-iOS-Programmatic-UI-Lab
//
//  Created by Bienbenido Angeles on 1/28/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainView = MainView()
    
    var score = 0
    var scoresOfGame = Set<Int>()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.randomColorView.backgroundColor = ColorModel.genRandomColor()
        view.backgroundColor = .systemBackground
        for button in mainView.buttons{
            button.addTarget(self, action: #selector(guessColor), for: .touchUpInside)
        }
        
        mainView.newGameButton.addTarget(self, action: #selector(resetButton(_:)), for: .touchUpInside)
    }

    @objc
    func guessColor(_ guessColor: UIButton){
        if guessColor.tag == ColorModel.getMaxColor(bgColor: mainView.randomColorView.backgroundColor!) {
            score+=1
            scoresOfGame.insert(score)
            mainView.userFeedBackLabel.text = "Correct guess. Your score is \(score). Your highest score is \(scoresOfGame.max()!)"
            mainView.randomColorView.backgroundColor! = ColorModel.genRandomColor()
        } else  {
            score = 0
            scoresOfGame.insert(score)
            mainView.userFeedBackLabel.text = "Incorrect guess. Your score is \(score). Your highest score is \(scoresOfGame.max()!)"
            mainView.randomColorView.backgroundColor! = ColorModel.genRandomColor()
        }
    }
    
    @objc
    func resetButton(_ sender: UIButton){
        score = 0
        scoresOfGame.removeAll()
        mainView.userFeedBackLabel.text = "Unknown guess. Your score is 0 and you highest score is 0."
    }
}

