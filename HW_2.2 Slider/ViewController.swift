//
//  ViewController.swift
//  HW_2.2 Slider
//
//  Created by Alexander Pismenskiy on 18.10.2020.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var screenView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.layer.cornerRadius = 20
        
        setColor()
        setValue(for: redValue, greenValue, blueValue)
    }
    
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0: redValue.text = string(from: sender)
        case 1: greenValue.text = string(from: sender)
        case 2: blueValue.text = string(from: sender)
        default: break
        }
    }
    
    
   private func setColor() {
        screenView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
       
  
    private func setValue (for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redValue.text = string(from: redSlider)
            case 1: greenValue.text = string(from: greenSlider)
            case 2: blueValue.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
            
    private func string(from slider: UISlider) -> String {
                String(format: "%.2f", slider.value)
            }
}



