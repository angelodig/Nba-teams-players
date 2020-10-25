//
//  SpinnerViewController.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 24/10/2020.
//

import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .orange
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension UIViewController {
    //Show spinner view method
    func showSpinnerView(viewForShowSpinner: UIView) {
        let spinnerView = SpinnerViewController()
        
        //Add the spinner view controller
        addChild(spinnerView)
        spinnerView.view.frame = viewForShowSpinner.frame
        view.addSubview(spinnerView.view)
        spinnerView.didMove(toParent: self)
        
        //Wait seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            //Then remove spinner view controller
            spinnerView.willMove(toParent: nil)
            spinnerView.view.removeFromSuperview()
            spinnerView.removeFromParent()
        }
    }
}
