/*:
 # Advanced Layout Techniques
 */
import UIKit
import XCPlayground
/*:
 ## Mixing Manual and Auto Layout
 
 There may be times that you want to manually layout a subview within a view that uses Auto Layout for the rest of its subviews.
 
 */

class SuperView: UIView {
  
  let subView1: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let subView2: UIView = {
    let view = UIView()
    view.backgroundColor = [#Color(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)#]
    
    // The SECRET
    view.translatesAutoresizingMaskIntoConstraints = true
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
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("(ノಠ益ಠ)ノ彡┻━┻")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let width = frame.width - inset * 2
    let height = frame.height / 2 - inset
    
    subView2.frame = CGRect(x: inset, y: height + inset, width: width, height: height)
  }
  
}

class SuperViewController: UIViewController {
  override func loadView() {
    view = SuperView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
  }
}

let vc = SuperViewController()

vc.view



























/*:
 ## Adjusting constraints based on layout
 */

class NumberView: UIView {
  
  let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  init(number: Int) {
    super.init(frame: CGRectZero)
    
    backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
    translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFontOfSize(40)
    
    addSubview(label)
    
    addConstraint(NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: label, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: label, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0))
    
    self.label.text = "\(number)"
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("(ノಠ益ಠ)ノ彡┻━┻")
  }
}

class AdjustingView: UIView {
  
  var labels = [NumberView]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
    translatesAutoresizingMaskIntoConstraints = true
    
    labels = (1...10).map { NumberView(number: $0) }
    labels.forEach { addSubview($0) }
    
    createConstraintsForLabels()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("(ノಠ益ಠ)ノ彡┻━┻")
  }

  private func createConstraintsForLabels() {
    let firstView = labels.first!
    
    addConstraint(NSLayoutConstraint(item: firstView, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: firstView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    
    for (view1, view2) in labels.pairs {
      addConstraint(NSLayoutConstraint(item: view2, attribute: .CenterY, relatedBy: .Equal, toItem: view1, attribute: .CenterY, multiplier: 1, constant: 0))
      addConstraint(NSLayoutConstraint(item: view2, attribute: .Left, relatedBy: .Equal, toItem: view1, attribute: .Right, multiplier: 1, constant: 5))
    }
  }
  
//  override func layoutSubviews() {
//    super.layoutSubviews()
//    
//    guard let lastLabel = labels.last else { return }
//    
//    if (!frame.contains(lastLabel.frame)) {
//      print("doesn't contain: \(lastLabel.label.text)")
//      lastLabel.removeFromSuperview()
//      labels.removeLast()
//      removeConstraints(constraints)
//      createConstraintsForLabels()
//      setNeedsLayout()
//    }
//  }
  
}

class AdjustingViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let adjustingView = AdjustingView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    view.addSubview(adjustingView)
  }
}

let vc2 = AdjustingViewController()
XCPlaygroundPage.currentPage.liveView = vc2.view

//: [Next](@next)
