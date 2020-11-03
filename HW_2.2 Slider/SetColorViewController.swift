//
//  ViewController.swift
//  HW_2.2 Slider
//
//  Created by Alexander Pismenskiy on 18.10.2020.
//

import UIKit

class SetColorViewController: UIViewController {
   
    @IBOutlet var screenView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    @IBOutlet var redValueTextField: UITextField!
    @IBOutlet var greenValueTextField: UITextField!
    @IBOutlet var blueValueTextField: UITextField!
    
    var color: UIColor!
    
    var delegate: MainViewControllerDelegate!
    var mainViewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.layer.cornerRadius = 20
        
        screenView.backgroundColor = mainViewColor
        
        setSliders()
        setValue(for: redValue, greenValue, blueValue)
        setValue(for: redValueTextField, greenValueTextField, blueValueTextField)
        addDoneButton(to: redValueTextField, greenValueTextField, blueValueTextField)
    }
    
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender.tag {
        case 0: setValue(for: redValue)
                setValue(for: redValueTextField)
        case 1: setValue(for: greenValue)
                setValue(for: greenValueTextField)
        case 2: setValue(for: blueValue)
                setValue(for: blueValueTextField)
        default: break
        }
        
        setColor()
    }
    
 
    @IBAction func doneButtonPresse() {
        delegate.changeColor(screenView.backgroundColor ?? .white)
        dismiss(animated: true)
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
    
    
    private func setValue (for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField.tag {
            case 0: redValueTextField.text = string(from: redSlider)
            case 1: greenValueTextField.text = string(from: greenSlider)
            case 2: blueValueTextField.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
            
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }


    private func setSliders() {
        let ciColor = CIColor(color: mainViewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func addDoneButton(to textFields: UITextField...) {
        
        textFields.forEach { textField in
            let keyboardToolbar = UIToolbar()
            textField.inputAccessoryView = keyboardToolbar
            keyboardToolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(
                title:"Done",
                style: .done,
                target: self,
                action: #selector(didTapDone)
            )
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            )
            
            keyboardToolbar.items = [flexBarButton, doneButton]
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}

extension SetColorViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: redValueTextField)
            case 1:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: greenValueTextField)
            case 2:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: blueValueTextField)
            default: break
            }
            
            setColor()
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
}
    



