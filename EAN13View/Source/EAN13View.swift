import UIKit

extension UIStackView{
    public convenience init(ean13: EAN13) {
        let lineViews = ean13.lines.map{ line -> UIView in
            let lineView = UIView()
            lineView.backgroundColor = line ? .black : .white
            return lineView
        }
        self.init(arrangedSubviews: lineViews)
        distribution = .fillEqually
    }
}
