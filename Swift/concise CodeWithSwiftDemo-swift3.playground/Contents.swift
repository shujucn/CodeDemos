//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var str = "Hello, playground"

extension UILabel {
    // Initialize our new label with the default initializer
    class func standardAwesomeLabel(title: String) -> UILabel {
        
        let label = UILabel()
        
        label.font = UIFont(name: "Menlo", size: 14)
        label.textColor = .white
        label.text = title
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
}


extension UIView { // Layout extension
    
    // This function will encapsulate the process of adding a view, enabling autolayout,
    // and configuring the common constraints
    func constrainTo(view: UIView) {
        
        // Turn on autolayout
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Because of the way we worded the function, view will be the parent and self,
        // the child. It might look a little strange here, but as you will see below, it
        // reads quite nicely in the call-sites.
        view.addSubview(self)
        
        // I was notified about the new NSLayoutAnchor system since my last post, this
        // makes alot nicer constraint building, so we use that here.
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}

extension UIStackView {
    // UIStackView has alot of things that are frequently changed from the defaults. This
    // new init overload will allow us to one-line most of it.
    convenience init(arrangedSubviews: [UIView],
                     axis: UILayoutConstraintAxis,
                     distribution: UIStackViewDistribution,
                     alignment: UIStackViewAlignment) {
        // Chain to the original initializer.
        self.init(arrangedSubviews: arrangedSubviews)

        // Set our custom properties here.
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        
        // Again, it's nice to hide this away, since we will always need it off anyways.
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
