/*:
 # The Layout Process
 
 Understanding the order of the various events given to you by UIKit is essential in playing nice with the framework.  When you do things that UIKit doesn't like, you will be 😰
 
 */
import UIKit
import XCPlayground

func sizeClassPrettyPrint(sizeClass: UIUserInterfaceSizeClass) -> String {
  switch sizeClass {
  case .Unspecified:
    return ".Unspecified"
  case .Compact:
    return ".Compact"
  case .Regular:
    return ".Regular"
  }
}

func traitCollectionPrettyPrint(traitCollection: UITraitCollection?) -> String {
  if let traitCollection = traitCollection {
    return "{\(sizeClassPrettyPrint(traitCollection.horizontalSizeClass)), \(sizeClassPrettyPrint(traitCollection.verticalSizeClass))}"
  } else {
    return "<none>"
  }
}

class PrintingView: UIView {
  
  var id: String!
  
  convenience init(id: String) {
    self.init(frame: CGRectZero)
    
    self.id = id
    print("\(id): init(id:) called")
  }
  
  convenience init(id: String, frame: CGRect) {
    self.init(frame: frame)
    
    self.id = id
    print("\(id): init(id:frame:) called")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("(ノಠ益ಠ)ノ彡┻━┻")
  }
  
  override func updateConstraints() {
    super.updateConstraints()
    print("\(id): updateConstraints")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    print("\(id): layoutSubviews")
  }
  
  override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    print("\(id): traitCollectionDidChange [previous: \(traitCollectionPrettyPrint(previousTraitCollection)), current: \(traitCollectionPrettyPrint(traitCollection))")
  }
  
}

class SuperView: PrintingView {
  
  let subView1: PrintingView = {
    let view = PrintingView(id: "redView")
    view.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let subView2: PrintingView = {
    let view = PrintingView(id: "blueView")
    view.backgroundColor = [#Color(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)#]
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let inset: CGFloat = 10
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
    translatesAutoresizingMaskIntoConstraints = true
    
    addSubview(subView1)
    addSubview(subView2)
    
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


class MyViewController: UIViewController {
  override func loadView() {
    view = SuperView(id: "SuperView", frame: CGRect(x: 0, y: 0, width: 200, height: 200))
  }
}

let vc = MyViewController()

XCPlaygroundPage.currentPage.liveView = vc.view


//: [Next](@next)
