/*:
 [Previous](@previous)
 # Auto Layout
 
 Auto Layout is a layout system that works with sets of constraints.  These constraints are of the form:
 
 `<view attribute 1> [=,<=,>=] <view attribute 2> * <multiplier> + <constant>`
 
 A example that constraints left edge of a view with its superviews left edge:
 
 `view.NSLayoutAttributeLeft = superview.NSLayoutAttributeLeft * 1 + 0`
 
 These constraints are then dynamically solved by Auto Layout to set the frames of all of the views.
 
 */
import UIKit
import XCPlayground

class AutoLayoutView: UIView {
  
  let subView1: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let subView2: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)#]
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let inset: CGFloat = 10
  
  override init(frame: CGRect) {
    print("init(frame:)")
    super.init(frame: frame)
    
    backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
    translatesAutoresizingMaskIntoConstraints = true
    
    addSubview(subView1)
    addSubview(subView2)
    
    // Auto Layout
    addConstraint(NSLayoutConstraint(item: subView1, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: inset))
    addConstraint(NSLayoutConstraint(item: subView1, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: inset))
    addConstraint(NSLayoutConstraint(item: subView1, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: -inset))
    addConstraint(NSLayoutConstraint(item: subView1, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 0.5, constant: 0))
    
    addConstraint(NSLayoutConstraint(item: subView2, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 0.5, constant: 0))
    addConstraint(NSLayoutConstraint(item: subView2, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: inset))
    addConstraint(NSLayoutConstraint(item: subView2, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: -inset))
    addConstraint(NSLayoutConstraint(item: subView2, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: -inset))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("(ノಠ益ಠ)ノ彡┻━┻")
  }
  
}

//: ### Instantiate view
let view = AutoLayoutView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

// Only necessary because of it being in a Playground
view.layoutIfNeeded()













//: #### Not even scared this time...
view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
view.layoutIfNeeded()









//: [Next](@next)
