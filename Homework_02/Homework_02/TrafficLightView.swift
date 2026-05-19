import UIKit

final class TrafficLightView: UIView {

    let trafficLightViewColor: UIColor

    init(_ trafficLightViewColor: UIColor) {
        self.trafficLightViewColor = trafficLightViewColor
        super.init(frame: .zero)
        setupTrafficLightView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setActive() {
        layer.opacity = 1.0
    }

    func setInactive() {
        layer.opacity = 0.5
    }

    private func setupTrafficLightView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = trafficLightViewColor
        layer.cornerRadius = 90
        layer.masksToBounds = true
        layer.opacity = 0.5
    }


    private func setupConstraints() {
        NSLayoutConstraint.activate([
        heightAnchor.constraint(equalToConstant: 180),
        widthAnchor.constraint(equalToConstant: 180),
        ])
    }

}
