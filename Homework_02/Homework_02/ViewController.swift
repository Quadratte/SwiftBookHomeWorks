
import UIKit

class ViewController: UIViewController {

    var lightModel = TrafficLightModel()

    let trafficLightStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .equalSpacing
        sv.spacing = 20
        return sv
    }()

    let redLight = TrafficLightView(.red)
    let yellowLight = TrafficLightView(.yellow)
    let greenLight = TrafficLightView(.green)

    let switchButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.setTitle("Start", for: .normal)
        btn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btn.layer.cornerRadius = 30
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        setupConstraints()
    }

    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(trafficLightStack)
        setupStackView()
    }

    private func setupStackView() {
        trafficLightStack.addArrangedSubview(redLight)
        trafficLightStack.addArrangedSubview(yellowLight)
        trafficLightStack.addArrangedSubview(greenLight)
        trafficLightStack.addArrangedSubview(switchButton)
    }

    private func setupActions() {
        switchButton.addAction(UIAction { [weak self] _ in
            self?.switchLight()
        }, for: .touchUpInside)
    }

    private func changeButtonTitle() {
        if switchButton.titleLabel?.text == "Start" {
            switchButton.setTitle("Next", for: .normal)
        }
    }

    private func switchLight() {
        lightModel.switchLight()

        switch lightModel.currentLight {
        case .none:
            redLight.setInactive()
            yellowLight.setInactive()
            greenLight.setInactive()
        case .red:
            redLight.setActive()
            yellowLight.setInactive()
            greenLight.setInactive()
        case .yellow:
            redLight.setInactive()
            yellowLight.setActive()
            greenLight.setInactive()
        case .green:
            redLight.setInactive()
            yellowLight.setInactive()
            greenLight.setActive()
        }

        changeButtonTitle()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            trafficLightStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            trafficLightStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            trafficLightStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            trafficLightStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
