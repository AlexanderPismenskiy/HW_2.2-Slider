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
    }
    func changeColor() {
        screenView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
        redValue.text = String(format:"%.2f", redSlider.value)
        greenValue.text = String(format:"%.2f", greenSlider.value)
        blueValue.text = String(format:"%.2f", blueSlider.value)
        }
    @IBAction func rgbSliderChange() {
        changeColor()
    }
}

