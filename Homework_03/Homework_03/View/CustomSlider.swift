import UIKit

final class CustomSlider: UISlider {

    enum CustomSliderStyles {
        case red, green, blue
    }

    let customSliderStyle: CustomSliderStyles

    init(_ customSliderStyle: CustomSliderStyles) {
        self.customSliderStyle = customSliderStyle
        super.init(frame: .zero)
        configureCustomSlider()
        applyCustomSliderStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCustomSlider() {
        translatesAutoresizingMaskIntoConstraints = false
        minimumValue = 0
        maximumValue = 1
        value = 0.5
    }

    private func applyCustomSliderStyles() {
        switch customSliderStyle {
        case .red:
            minimumTrackTintColor = .red
        case .green:
            minimumTrackTintColor = .green
        case .blue:
            minimumTrackTintColor = .blue
        }
    }
}
