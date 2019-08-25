//
//  TransitionView.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class TransitionView: UIView {
    
    // MARK: Properties
    
    private var spinner: UIActivityIndicatorView?
    

    // MARK: Init and Deinit
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.configureView()
    }
    
    // MARK: Private API
    
    private func configureView() {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        
        spinner.hidesWhenStopped = true
        spinner.color = .black
        self.spinner = spinner
        self.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.hide()
    }
    
    func show() {
        self.superview.map {
            self.spinner?.startAnimating()
            self.backgroundColor = UIColor.white.withAlphaComponent(0.4)
            $0.bringSubviewToFront(self)
        }
    }
    
    func hide() {
        self.superview.map {
            self.spinner?.stopAnimating()
            self.backgroundColor = .clear
            $0.sendSubviewToBack(self)
        }
    }
}
