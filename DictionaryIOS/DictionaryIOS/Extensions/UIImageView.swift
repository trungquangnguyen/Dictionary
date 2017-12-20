
import UIKit
import SDWebImage

private var indicatorKey: UInt8 = 0

extension UIImageView {
    func setImageWithURLString(string: String, placeholder: UIImage? = nil, supperView: UIView?, complete: (() -> Void)? = nil){
         let url = URL(string: string)
        guard supperView != nil else {
            self.sd_setImage(with: url, placeholderImage: placeholder, options: []) { (image, _, _, _) in
                complete?()
            }
            return
        }        
        var loadding: UIActivityIndicatorView!
        for view in  self.superview!.subviews {
            if view.className == UIActivityIndicatorView.className{
                loadding = view as? UIActivityIndicatorView
            }
        }
        if loadding == nil {
            loadding = UIActivityIndicatorView()
            loadding.activityIndicatorViewStyle = .gray
            superview!.addSubview(loadding)
            loadding.translatesAutoresizingMaskIntoConstraints = false
            
            let horizontalConstraint = NSLayoutConstraint(item: loadding, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: loadding, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
            let widthConstraint = NSLayoutConstraint(item: loadding, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 50)
            let heightConstraint = NSLayoutConstraint(item: loadding, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 50)
            supperView!.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        }
        
        loadding.startAnimating()
        
        self.sd_setImage(with: url, placeholderImage: placeholder, options: []) { (image, _, _, _) in
            DispatchQueue.main.async {
                loadding.stopAnimating()
            }
            complete?()
        }
    }
}
