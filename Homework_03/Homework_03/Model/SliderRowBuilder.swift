import UIKit

final class SliderRowBuilder {

    static func build(title: String, slider: CustomSlider, valueLabel: AppLabel) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        stack.distribution = .fill

        let titleLabel = AppLabel(title, .left)
        titleLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true

        valueLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        valueLabel.textAlignment = .center

        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(valueLabel)
        stack.addArrangedSubview(slider)

        return stack
    }
}
