/*:
 [Previous](@previous)
 # Manual Layout - Part 4
 
What if you want to change the values used in your layout code?
 
 */
import UIKit
import XCPlayground

class ManualLayoutView: UIView {
  
  let subView1: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
    return view
  }()
  
  let subView2: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)#]
    return view
  }()
  
  // Now we can change this, right?
  var inset: CGFloat = 10
  
  override init(frame: CGRect) {
    print("init(frame:)")
    super.init(frame: frame)
    
    backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
    
    addSubview(subView1)
    addSubview(subView2)
  }
  
  override func layoutSubviews() {
    print("layoutSubviews")
    
    // Constant, no longer
    // let inset: CGFloat = 10
    
    let width = frame.width - inset * 2
    let height = frame.height / 2 - inset
    
    subView1.frame = CGRect(x: inset, y: inset, width: width, height: height)
    subView2.frame = CGRect(x: inset, y: height + inset, width: width, height: height)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("(ノಠ益ಠ)ノ彡┻━┻")
  }
  
}


//: ### Instantiate view
let view = ManualLayoutView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//: #### Let's change the inset!
view.inset = 40






























/*:
 ## WHAT?
 
 With our current code, UIKit has no idea that the values which generated the layout have changed.  In order to fix it, you need to tell the layout system when it needs to recompute layout.  
 
 Simple? Sure, let's just call `layoutSubviews`
 
  */
 
 
 



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*:
 ## NO
 
 Think of all of the changes that might take place in a single run loop.  It would be inefficient to run layout more than necessary. Instead, you can call `setNeedsLayout` which tells UIKit to perform layout on the next pass.
 
 Try calling `setNeedsLayout()` directly below.
 */
view.setNeedsLayout()





























/*:
 ## EVEN BETTER
 
 Have the view call its own `setNeedsLayout` whenever the `inset` value changes.
 */



//: [Next](@next)
