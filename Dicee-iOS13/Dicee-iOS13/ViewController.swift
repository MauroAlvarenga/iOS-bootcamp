//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let imageArray: [UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    var buttonState: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }

    func setupButton() {
        rollButton.layer.cornerRadius = 10
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        switch buttonState {
        case true:
            animateDice(withTransform: CGAffineTransform(rotationAngle: .pi))
        case false:
            animateDice(withTransform: .identity)
        }
        buttonState.toggle()

    }
    
    func animateDice(withTransform transform: CGAffineTransform) {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.5) {
                self?.diceImageViewOne.transform = transform
                self?.diceImageViewTwo.transform = transform
            } completion: { _ in
                self?.randomDices()
            }
        }
    }
    
    func randomDices() {
        diceImageViewOne.image = imageArray.randomElement()
        diceImageViewTwo.image = imageArray.randomElement()
    }
    
    // TODO: Agregar toggles de animar o no, y de cuanto tiempo quiero que dure la animación.
}

