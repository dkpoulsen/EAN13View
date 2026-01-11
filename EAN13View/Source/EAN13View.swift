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

public class EAN13View: UIView {
    
    private let ean13: EAN13
    
    public init(ean13: EAN13) {
        self.ean13 = ean13
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let barcodeStackView = UIStackView(ean13: ean13)
        barcodeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let numberLabel = UILabel()
        numberLabel.text = ean13.value
        numberLabel.textAlignment = .center
        numberLabel.font = UIFont.systemFont(ofSize: 12)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let containerStackView = UIStackView(arrangedSubviews: [barcodeStackView, numberLabel])
        containerStackView.axis = .vertical
        containerStackView.spacing = 4
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
