import UIKit

final class AppLabel: UILabel {
    let labelText: String
    let alignment: NSTextAlignment

    init(_ labelText: String, _ alignment: NSTextAlignment) {
        self.labelText = labelText
        self.alignment = alignment
        super.init(frame: .zero)
        setupAppLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupAppLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        text = labelText
        textColor = .label
        numberOfLines = 1

    }
}
