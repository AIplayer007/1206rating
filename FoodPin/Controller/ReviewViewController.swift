//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2021/12/6.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!

    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundImageView.image = UIImage(named: restaurant.image)
        // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)   //.light or .extraLight
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
    
        // Make the button invisible
        for rateButton in rateButtons {
        rateButton.transform = moveRightTransform
        rateButton.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Animate the rate buttons
        for index in 0...4 {
            UIView.animate(withDuration: 0.4, delay: 0.1+0.05*Double(index), options: [], animations:
                            {
                                self.rateButtons[index].alpha = 1.0
                                self.rateButtons[index].transform = .identity
                            }, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
