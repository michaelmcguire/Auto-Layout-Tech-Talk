import UIKit
import XCPlayground

/*:
 # Manual Layout - Part 4
 
What if you want to change the values used in your layout code?
 
 */

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
  
  // Now we can change this, right?
  var inset: CGFloat = 10
  
  // Default initializer
  override init(frame: CGRect) {
    print("init(frame:)")
    super.init(frame: frame)
    
    backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
    
    // Make sure to add the subviews!
    addSubview(subView1)
    addSubview(subView2)
    
    // Look ma, no positioning! 🚴🏼
    
  }
  
  
  // What about super?
  override func layoutSubviews() {
    print("layoutSubviews")
    
    // Constant, no longer
    // let inset: CGFloat = 10
    
    let width = frame.width - inset * 2
    let height = frame.height / 2 - inset
    
    subView1.frame = CGRect(x: inset, y: inset, width: width, height: height)
    subView2.frame = CGRect(x: inset, y: height + inset, width: width, height: height)
  }
  
  // Sonuva
  required init?(coder aDecoder: NSCoder) {
    fatalError("(ノಠ益ಠ)ノ彡┻━┻")
  }
  
}


//: ### Instantiate view
let view = ManualLayoutView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))













//: #### Let's change the inset!
view.inset = 40










//: [Next](@next)
