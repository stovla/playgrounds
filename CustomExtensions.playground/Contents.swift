import UIKit

extension Sequence {
    // this code generates pairs
    func eachPair() -> AnySequence<(Element, Element)> {
        return AnySequence(zip(self, self.dropFirst()))
    }
}
[1, 2, 3, 4].eachPair()

// this code will sum all number elements in a sequence
extension Sequence where Element: Numeric {
    var sum: Element {
        return self.reduce(0, +)
    }
}

// this code will give you the avarage of any sequence of numbers
extension Array where Element: BinaryFloatingPoint {
    var avarage: Element {
        return self.reduce(0, +) / Element(self.count)
    }
}

    func *(lhs: Int, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs) * rhs
    }
    func *(lhs: CGFloat, rhs: Int) -> CGFloat {
        return CGFloat(rhs) * lhs
    }

// this code will return a bool if every element satisfies a given predicate condition
extension Sequence {
    func all(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if !predicate(element) {
                return false
            }
        }
        return true
    }
}

[3, 2, 1].all { $0 > 0 }
[3, 2, 1, 0, -1, -2, -3].all { $0 > 0 }

// this code returns a bool if every element does not satisfy a predicate condition
extension Sequence {
    func none(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return false
            }
        }
        return true
    }
}

[1, 2, 3].none({ $0 > 0})

extension Sequence {
    func any(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return true
            }
        }
        return false
    }
}

// count of sequence
extension Sequence {
    func count(where predicate: (Element) -> Bool) -> Int {
        var count = 0
        for element in self {
            if predicate(element) {
                count += 1
            }
        }
        return count
    }
}

// unique elements
extension Sequence {
    
    func uniqueElements(by elementsEqual: (Element, Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for element in self {
            if !result.contains(where: { resultElement in
                elementsEqual(element, resultElement) }) {
                result.append(element)
            }
        }
        return result
    }
}

extension Sequence where Element: Equatable {
    func uniqueElements() -> [Element] {
        return uniqueElements(by: ==)
    }
}

// property accessor SORTED by
//before houses.sorted(by: { $0.numberOfResidents < $1.numberOfResidents
extension Sequence {
    func sorted<T: Comparable>(on propertyAccessor: (Element) -> T) -> [Element] {
        return sorted(by: { propertyAccessor($0) < propertyAccessor($1) })
    }
}
//after houses.sorted(on: { $0.numberOfResidents })

/// add an array of subviews
extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
}

// data
extension Data {
    var hexString: String {
        return self
            .map({ return String(format: "%02hhx", $0) })
            .joined()
    }
}

// chunk elements
extension Array {
    func chunk(size: Int) -> [[Element]] {
        let steps = stride(
            from: self.startIndex,
            to: self.endIndex,
            by: size)
        
        return steps.map({ i -> Array<Element> in
            let end = self.index(i, offsetBy: size, limitedBy:self.endIndex) ?? self.endIndex
            return Array(self[i ..< end])
        })
    }
}

// aspect ratio of UIImage
extension UIImage {
    var aspectRatio: CGFloat {
        return size.width / size.height
    }
}

// cancelling any gesture recognizers
extension UIGestureRecognizer {
    func cancel() {
        isEnabled = false
        isEnabled = true
    }
}

// if view is visible
extension UIViewController {
    var isVisible: Bool {
        return self.isViewLoaded && self.view.window != nil
    }
}

// layout anchors
extension UIView {
    
    func addCenterYAnchor(to: UIView, constant: CGFloat = 0) {
        let guide = to.layoutMarginsGuide
        centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: constant).isActive = true
    }
    
    func addCenterXAnchor(to: UIView, constant: CGFloat = 0) {
        let guide = to.layoutMarginsGuide
        centerXAnchor.constraint(equalTo: guide.centerXAnchor, constant: constant).isActive = true
    }
    
    func addLeftAnchor(to: UIView, constant: CGFloat = 0) {
        let guide = to.layoutMarginsGuide
        leftAnchor.constraint(equalTo: guide.leftAnchor, constant: constant).isActive = true
    }
    
    func addRightAnchor(to: UIView, constant: CGFloat = 0) {
        let guide = to.layoutMarginsGuide
        rightAnchor.constraint(equalTo: guide.rightAnchor, constant: constant).isActive = true
    }
    
    func addBottomAnchor(to: UIView, constant: CGFloat = 0) {
        let guide = to.layoutMarginsGuide
        bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: constant).isActive = true
    }
    
    func addTopAnchor(to: UIView, constant: CGFloat = 0) {
        let guide = to.layoutMarginsGuide
        topAnchor.constraint(equalTo: guide.topAnchor, constant: constant).isActive = true
    }
}
