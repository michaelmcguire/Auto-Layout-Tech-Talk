/*:
 [Previous](@previous)
 
 # Manual Layout - Part 1
 
 `UIView`'s have a frame property that can be used to position subviews within their parent.  Coordinates are local to the parent view.  So if a subview has a frame with origin `(0, 0)` it will appear in the upper left corner of the parent view.
 
 */
import UIKit
import XCPlayground

class ManualLayoutView: UIView {
  
  // Subview #1
  let subView1: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
    return view
  }()
  
  // Subview #2
  let subView2: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)#]
    return view
  }()
  
  // Default initializer
  override init(frame: CGRect) {
    print("init(frame:)")
    super.init(frame: frame)
    
    backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
    
    // Make sure to add the subviews!
    addSubview(subView1)
    addSubview(subView2)
    
    // Manually position subview1 in the upper left corner, but inset by 10, 10
    subView1.frame = CGRect(x: 10, y: 10, width: 180, height: 90)
    
    // Manually position subview2 just below subview 1
    subView2.frame = CGRect(x: 10, y: 100, width: 180, height: 90)
  }
  
  // Sonuva
  required init?(coder aDecoder: NSCoder) {
    fatalError("(ノಠ益ಠ)ノ彡┻━┻")
  }
  
}













//: ### Let's instantiate the view and display it
let view = ManualLayoutView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))



































//: #### What happens when you try to resize the view? 🎻
view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)






















//: [Next](@next)
