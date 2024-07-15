//
//  MiniGameCustomView.swift
//  HomeworkRoundGame
//
//  Created by Левиафан on 2024-06-20.
//

import UIKit

class MiniGameCustomView: UIView {
    
    var customView: UIView!
    var xibName: String = "MiniGameCustomView"
    
    let colorRed = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    
    func getFromXib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setCustomView() {
        customView = getFromXib()
        customView.frame = bounds
        customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        customView.layer.cornerRadius = frame.size.width / 2
        addSubview(customView)
    }
    
    func changeSize() {
        let center = self.customView.center
        customView.frame.size.height += 5
        customView.frame.size.width += 5
        customView.layer.cornerRadius = customView.frame.size.width / 2
        customView.center = center

    }
    
    func changeColor() {
        customView.backgroundColor = colorRed
    }
    
    func changeAnimation() {
        let center = self.customView.center
        UIView.animate(withDuration: 2, delay: 0.5,usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut){
            self.customView.backgroundColor = self.colorRed
            self.customView.frame.size.height += 5
            self.customView.frame.size.width += 5
            self.customView.layer.cornerRadius = self.customView.frame.size.width / 2
            self.customView.center = center
        }
    }
    
}
