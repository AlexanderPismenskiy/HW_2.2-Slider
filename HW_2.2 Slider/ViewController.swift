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
        redValue.text = String(redSlider.value)
        greenValue.text = String(greenSlider.value)
        blueValue.text = String(blueSlider.value)
    }
    func changeColor() {
        screenView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    @IBAction func rgbSliderChange() {
        changeColor()
    }
}

