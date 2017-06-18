//
//  IconLabel.swift
//  LoveMovie
//
//  Created by Duy Nguyen on 6/19/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

class IconLabel: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBInspectable var icon: UIImage? {
        get {
            return imageView.image
        }
        
        set(newImage) {
            imageView.image = newImage
        }
    }
    
    @IBInspectable var text: String? {
        get {
            return textLabel.text
        }
        
        set(newText) {
            textLabel.text = newText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        render()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        render()
    }
    
    // MARK: - Private Helper Methods
    
    // Performs the initial setup.
    fileprivate func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    private func render() {
        textLabel.textColor = UIColor.white
    }

}
