//
//  XIBView.swift
//  TestTask
//
//  Created by Rudolph Rodion on 17.01.2022.
//

import UIKit


class xibView: UIView {

    
    let contentXibName = "xibView"
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var timeshampLabel: UILabel!
    @IBAction func readMoreButton(_ sender: UIButton) {
    }
    @IBAction func likeButton(_ sender: UIButton) {
    }
    
        override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder ) { // for using CustomView in IB
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        // stuff here
        Bundle.main.loadNibNamed(contentXibName, owner: self, options: nil)
        contentView.fixInView(self)
        
    }
}

extension UIView {
    func fixInView(_ container: UIView!) -> Void {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
    
}






