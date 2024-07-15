//
//  ViewController.swift
//  HomeworkRoundGame
//
//  Created by Левиафан on 2024-06-20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentView: [MiniGameCustomView]!
    
    @IBOutlet weak var circleOne: MiniGameCustomView!
    @IBOutlet weak var circleTwo: MiniGameCustomView!
    @IBOutlet weak var circleThree: MiniGameCustomView!
    @IBOutlet weak var circleFour: MiniGameCustomView!
    @IBOutlet weak var circleFive: MiniGameCustomView!
    @IBOutlet weak var circleSix: MiniGameCustomView!
    @IBOutlet weak var circleSeven: MiniGameCustomView!
    @IBOutlet weak var circleEight: MiniGameCustomView!
    
    let colorRed = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    let colorGreen = UIColor(red: 0.0/255.0, green: 100.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let circles = [circleOne, circleTwo, circleThree, circleFour, circleFive, circleSix, circleSeven, circleEight]
        let sizes: [CGFloat] = [65, 55, 50, 60, 70, 65, 70, 55]
        
        for (index, circle) in circles.enumerated() {
            configureCircle(circle: circle!, size: sizes[index])
        }
        
    }
        
       
    private func configureCircle(circle: MiniGameCustomView, size: CGFloat) {
        circle.customView.backgroundColor = colorGreen
        circle.customView.frame.size = CGSize(width: size, height: size)
        circle.customView.layer.cornerRadius = size / 2
    }

    private func handlePanAction(for circle: MiniGameCustomView, sender: UIPanGestureRecognizer) {
        let valueX = Int(circle.center.x)
        let valueY = Int(circle.center.y)

        let circles = [circleOne, circleTwo, circleThree, circleFour, circleFive, circleSix, circleSeven, circleEight]

        for targetCircle in circles {
            if let targetCircle = targetCircle, targetCircle != circle, !targetCircle.isHidden {
                let targetX = Int(targetCircle.frame.minX)...Int(targetCircle.frame.maxX)
                let targetY = Int(targetCircle.frame.minY)...Int(targetCircle.frame.maxY)
                if targetX.contains(valueX) && targetY.contains(valueY) {
                    circle.isHidden = true
                    targetCircle.changeAnimation()
                    break
                }
            }
        }

        let gestureTranslation = sender.translation(in: view)
        guard let gestureView = sender.view else { return }

        gestureView.center = CGPoint(x: gestureView.center.x + gestureTranslation.x, y: gestureView.center.y + gestureTranslation.y)
        sender.setTranslation(.zero, in: view)
    }

    @IBAction func panActionOne(_ sender: UIPanGestureRecognizer) {
        handlePanAction(for: circleOne, sender: sender)
    }

    @IBAction func panActionTwo(_ sender: UIPanGestureRecognizer) {
        handlePanAction(for: circleTwo, sender: sender)
    }

    @IBAction func panActionThree(_ sender: UIPanGestureRecognizer) {
        handlePanAction(for: circleThree, sender: sender)
    }

    @IBAction func panActionFour(_ sender: UIPanGestureRecognizer) {
        handlePanAction(for: circleFour, sender: sender)
    }

    @IBAction func panActionFive(_ sender: UIPanGestureRecognizer) {
        handlePanAction(for: circleFive, sender: sender)
    }

    @IBAction func panActionSix(_ sender: UIPanGestureRecognizer) {
        handlePanAction(for: circleSix, sender: sender)
    }

    @IBAction func panActionSeven(_ sender: UIPanGestureRecognizer) {
        handlePanAction(for: circleSeven, sender: sender)
    }

    @IBAction func panActionEight(_ sender: UIPanGestureRecognizer) {
        handlePanAction(for: circleEight, sender: sender)
    }
}
    
        
        
    
    

