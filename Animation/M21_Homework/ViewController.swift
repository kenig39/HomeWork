//
//  ViewController.swift
//  M21_Homework
//
//  Created by Maxim Nikolaev on 15.02.2022.
//

import UIKit

class ViewController: Fish {
    var isFishCatched = false
    var numberOfTap = 0
    
    lazy var fishes = [fish, fish1, fish2, fish3, fish4]
    
    
    
    var ressetButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 165, y: 650, width: 60, height: 30)
        button.setTitle("Restart", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    
    @objc func resetFishButton(){
        UIApplication.shared.windows[0].rootViewController = UIStoryboard(
            name: "Main", bundle: nil
        ).instantiateInitialViewController()
    }
    
    lazy var countNumber: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 165, y:  700, width: 150, height: 50)
        label.text = "поймано \(self.numberOfTap)  рыбок"
        label.textColor = .red
        return label
    }()
    
    
    func randomFloat() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tap)
        ressetButton.addTarget(self, action: #selector(resetFishButton), for: .touchUpInside)
        
        let backImage = UIImage(named: "ocean") ?? UIImage()
        view.backgroundColor = UIColor(patternImage: backImage)
        view.addSubview(fish)
        view.addSubview(fish1)
        view.addSubview(fish2)
        view.addSubview(fish3)
        view.addSubview(fish4)
        view.addSubview(countNumber)
        
        moveLeft()
        
    }
    
    
    func moveLeft() {
        
        UIView.animate(withDuration: 1.0,
                       delay: 1.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
            
            self.fishes.forEach{ fish in
                let xPos = fish.frame.width * 0.7 + self.randomFloat() * (self.view.frame.width - fish.frame.width)
                
                let yPos = self.view.frame.minY + fish.frame.height * 0.3 + self.randomFloat() * (self.view.frame.height - fish.frame.height)
                fish.center = CGPoint(x: xPos, y: yPos)
            }
        },
                       completion: { finished in
            self.moveRight()
        })
        
    }
    
    
    
    
    
    func uiViewAnimate(complition: Void){
        if isFishCatched {return}
        UIView.animate(withDuration: 1.0,
                       delay: 0.8,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: { self.fishes.forEach{ fish in
            let xPos = fish.frame.width * 0.7 + self.randomFloat() * (self.view.frame.width - fish.frame.width)
            
            let yPos = self.view.frame.minY + fish.frame.height * 0.3 + self.randomFloat() * (self.view.frame.height - fish.frame.height)
            fish.center = CGPoint(x: xPos, y: yPos)
        }
            
        }, completion: { _ in
            complition
        })
        
    }
    
    
    
    
    func moveRight() {
        
        uiViewAnimate(complition: self.moveTop())
    }
    
    func moveTop() {
        
        uiViewAnimate(complition: self.moveBottom())
    }
    
    func moveBottom() {
        
        uiViewAnimate(complition: self.moveLeft())
    }
    
    
    
    
    @objc func didTap(_ gesture: UITapGestureRecognizer) {
        self.numberOfTap += 1
       
        for f in fishes {
            
            let topLocation = gesture.location(in: f.superview)
            
            if  (fish.layer.presentation()?.frame.contains(topLocation))! {
                tapNumber()
                fishCatchedAnimationTap(fishTap: fish)
                
                
            } else if (fish1.layer.presentation()?.frame.contains(topLocation))!{
                tapNumber()
                fishCatchedAnimationTap(fishTap: fish1)
                
            }   else if (fish2.layer.presentation()?.frame.contains(topLocation))!{
                tapNumber()
                fishCatchedAnimationTap(fishTap: fish2)
                
            } else if (fish3.layer.presentation()?.frame.contains(topLocation))!{
                tapNumber()
                fishCatchedAnimationTap(fishTap: fish3)
            } else if (fish4.layer.presentation()?.frame.contains(topLocation))!{
                tapNumber()
                fishCatchedAnimationTap(fishTap: fish4)
            }
        }
    }
    
    func tapNumber(){
       // print("колличество нажатий \(numberOfTap)")
        self.countNumber.text = " catch \(numberOfTap) fish"
        if (numberOfTap == 5) {
            self.view?.addSubview(ressetButton)
        }
        
        if isFishCatched { return }
        isFishCatched = true
    }
    
    
    func fishCatchedAnimationTap(fishTap: UIImageView){
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.5,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
            fishTap.alpha = 0.4
        }, completion: { _ in
            fishTap.removeFromSuperview()
        })
        
        
    }
}


        
