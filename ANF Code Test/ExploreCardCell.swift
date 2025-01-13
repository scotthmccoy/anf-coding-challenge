

import Foundation
import UIKit

class ExploreCardCell : UITableViewCell {

    var marginBox = UIView()
    var lblTitle = UILabel()
    var productImageView = UIImageView()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        // set up constraints
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        self.marginBox.translatesAutoresizingMaskIntoConstraints = false
        self.lblTitle.translatesAutoresizingMaskIntoConstraints = false
        self.productImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.lblTitle.numberOfLines = -1
        self.contentView.addSubview(marginBox)
        marginBox.addSubview(lblTitle)
        marginBox.addSubview(productImageView)
        
        
        
        let marginLeft:CGFloat = 20.0
        let marginRight:CGFloat = 20.0
        let marginTop:CGFloat = 5.0
        let marginBottom:CGFloat = 5.0
        let controlWidthPercentage: CGFloat = 0.55
        
        //Add constraints
        let constraints = [
            NSLayoutConstraint(item:marginBox, attribute:.left, relatedBy:.equal, toItem:self, attribute:.left, multiplier:1.0, constant:marginLeft),
            NSLayoutConstraint(item:marginBox, attribute:.top, relatedBy:.equal, toItem:self, attribute:.top, multiplier:1.0, constant:marginTop),
            NSLayoutConstraint(item:marginBox, attribute:.bottom, relatedBy:.equal, toItem:self, attribute:.bottom, multiplier:1.0, constant:-marginBottom),
            NSLayoutConstraint(item:marginBox, attribute:.right, relatedBy:.equal, toItem:self, attribute:.right, multiplier:1.0, constant:-marginRight),
            
            NSLayoutConstraint(item:lblTitle, attribute:.width, relatedBy:.equal, toItem:marginBox, attribute:.width, multiplier:1-controlWidthPercentage, constant:0),
            NSLayoutConstraint(item:lblTitle, attribute:.height, relatedBy:.equal, toItem:marginBox, attribute:.height, multiplier:1.0, constant:0),
            NSLayoutConstraint(item:lblTitle, attribute:.top, relatedBy:.equal, toItem:marginBox, attribute:.top, multiplier:1.0, constant:0),
            NSLayoutConstraint(item:lblTitle, attribute:.left, relatedBy:.equal, toItem:marginBox, attribute:.left, multiplier:1.0, constant:0),
            NSLayoutConstraint(item:lblTitle, attribute:.right, relatedBy:.equal, toItem:productImageView, attribute:.left, multiplier:1.0, constant:0),
            
            NSLayoutConstraint(item:productImageView, attribute:.width, relatedBy:.equal, toItem:marginBox, attribute:.width, multiplier:controlWidthPercentage, constant:0),
            NSLayoutConstraint(item:productImageView, attribute:.height, relatedBy:.equal, toItem:marginBox, attribute:.height, multiplier:1.0, constant:0),
            NSLayoutConstraint(item:productImageView, attribute:.top, relatedBy:.equal, toItem:marginBox, attribute:.top, multiplier:1.0, constant:0),
            NSLayoutConstraint(item:productImageView, attribute:.bottom, relatedBy:.equal, toItem:marginBox, attribute:.bottom, multiplier:1.0, constant:0),
            NSLayoutConstraint(item:productImageView, attribute:.right, relatedBy:.equal, toItem:marginBox, attribute:.right, multiplier:1.0, constant:0)
            //NSLayoutConstraint(item:control, attribute:.height, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier:1.0, constant:controlHeight)
            
        ]

        NSLayoutConstraint.activate(constraints)
        self.addConstraints(constraints)
    }
    
    required init?(coder:NSCoder) {
        fatalError("Not implemented")
    }
    
    // Suppress textLabel
    override var textLabel: UILabel? {
        return nil
    }
    
    override var imageView: UIImageView? {
        return nil
    }
    
    // Manually called when a cell appears
    func configure(data: [AnyHashable: Any]) {
        AppLog("data: \(data)")
        
        lblTitle.text = data["title"] as? String ?? "Name Not Found"

        // Load from xcassets
        if let imageName = data["backgroundImage"] as? String,
        let image = UIImage(named: imageName) {
            productImageView.image = image
        } else {
            productImageView.image = nil
        }
    }
}
