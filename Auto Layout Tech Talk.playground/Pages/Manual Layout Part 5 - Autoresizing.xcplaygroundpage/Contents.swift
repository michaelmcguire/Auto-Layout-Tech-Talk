/*:
[Previous](@previous)
 # Manual Layout Part 5 - Autoresizing
 
 Beyond setting the `frame` of a subview, UIKit has had limited support for a more declarative layout using Autoresizing masks
 
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
  
  let subView3: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 0.9446166753768921, green: 0.6509571671485901, blue: 0.155896782875061, alpha: 1)#]
    return view
  }()
  
  let subView4: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 0.4776530861854553, green: 0.2292086482048035, blue: 0.9591622352600098, alpha: 1)#]
    return view
  }()
  
  override init(frame: CGRect) {
    print("init(frame:)")
    super.init(frame: frame)
    
    backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
    
    addSubview(subView1)
    addSubview(subView2)
    addSubview(subView3)
    addSubview(subView4)
    
    let inset: CGFloat = 10
    let width: CGFloat = 20
    let height: CGFloat = 20
    
    subView1.frame = CGRect(x: inset,
                            y: inset,
                            width: width,
                            height: height)
    subView2.frame = CGRect(x: inset,
                            y: frame.height - inset - height,
                            width: width,
                            height: height)
    subView3.frame = CGRect(x: frame.width - inset - width,
                            y: inset,
                            width: width,
                            height: height)
    subView4.frame = CGRect(x: inset,
                            y: frame.width - inset - width,
                            width: width,
                            height: height)
    subView4.frame = CGRect(x: frame.width - inset - width,
                            y: frame.height - inset - height,
                            width: width,
                            height: height)
    
    // M.A.S.K crusaders, working overtime, fighting crime, fighting crime!
    // https://www.youtube.com/watch?v=gMNsDOOW0Ck
    subView1.autoresizingMask = [
      .FlexibleHeight,
      .FlexibleWidth
    ]
    subView2.autoresizingMask = [
      .FlexibleHeight
    ]
    subView3.autoresizingMask = [
      .FlexibleBottomMargin,
      .FlexibleLeftMargin
    ]
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("(ノಠ益ಠ)ノ彡┻━┻")
  }
  
}


//: ### Instantiate view
let view = ManualLayoutView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))




//: #### What we got here
view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)

/*     
 subView1.autoresizingMask = [
  .FlexibleHeight,
  .FlexibleWidth
 ]
 subView2.autoresizingMask = [
  .FlexibleHeight
 ]
 subView3.autoresizingMask = [
  .FlexibleBottomMargin,
  .FlexibleLeftMargin
 ]
*/










//: [Next](@next)
