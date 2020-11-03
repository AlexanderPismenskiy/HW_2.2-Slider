//
//  MainViewController.swift
//  HW_2.2 Slider
//
//  Created by Alexander Pismenskiy on 31.10.2020.
//

import UIKit

protocol MainViewControllerDelegate {
    func changeColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let setColorVC = segue.destination as! SetColorViewController
        setColorVC.delegate = self
        setColorVC.mainViewColor = view.backgroundColor
        
    }
}

extension MainViewController: MainViewControllerDelegate {
    func changeColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}


