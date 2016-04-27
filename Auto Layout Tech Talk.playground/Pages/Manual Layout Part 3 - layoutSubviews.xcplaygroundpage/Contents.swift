/*:
  [Previous](@previous)
 # Manual Layout - Part 3
 
 `UIView`'s have a `layoutSubviews()` method that can be overriden to position child views.  This method is called when a `UIView`'s `frame` _changes_.
 
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
  
  override init(frame: CGRect) {
    print("init(frame:)")
    super.init(frame: frame)
    
    backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
    
    addSubview(subView1)
    addSubview(subView2)
    
    // Look ma, no positioning! 🚴🏼

  }
  
  
  // What about super?
  override func layoutSubviews() {
    print("layoutSubviews")

    let inset: CGFloat = 10

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









//: #### Gonna work this time, right? 😁
view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
































//: [Next](@next)
