import UIKit

final class CustomView: UIView {

    let customViewColor: UIColor

    init(_ customViewColor: UIColor) {
        self.customViewColor = customViewColor
        super.init(frame: .zero)
        setupCustomView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCustomView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = customViewColor
    }
}
