import UIKit

class MainViewController: UIViewController {

    private var colorModel = AdjustColorModel()

    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 30
        stack.alignment = .fill
        return stack
    }()

    private let sliderStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.distribution = .fillEqually
        return stack
    }()

    let colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray4.cgColor
        return view
    }()

    let redValueLabel = AppLabel("0.50", .center)
    let greenValueLabel = AppLabel("0.50", .center)
    let blueValueLabel = AppLabel("0.50", .center)

    let redSlider = CustomSlider(.red)
    let greenSlider = CustomSlider(.green)
    let blueSlider = CustomSlider(.blue)

    private lazy var redSliderStack = SliderRowBuilder.build(title: "Red", slider: redSlider, valueLabel: redValueLabel)
    private lazy var greenSliderStack = SliderRowBuilder.build(title: "Green", slider: greenSlider, valueLabel: greenValueLabel)
    private lazy var blueSliderStack = SliderRowBuilder.build(title: "Blue", slider: blueSlider, valueLabel: blueValueLabel)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        setupConstraints()
        updateUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainStack)

        mainStack.addArrangedSubview(colorView)
        mainStack.addArrangedSubview(sliderStack)

        sliderStack.addArrangedSubview(redSliderStack)
        sliderStack.addArrangedSubview(greenSliderStack)
        sliderStack.addArrangedSubview(blueSliderStack)
    }

    private func setupActions() {
        redSlider.addAction(UIAction { [weak self] _ in
            self?.updateUI()
        }, for: .valueChanged)

        greenSlider.addAction(UIAction { [weak self] _ in
            self?.updateUI()
        }, for: .valueChanged)

        blueSlider.addAction(UIAction { [weak self] _ in
            self?.updateUI()
        }, for: .valueChanged)

    }

    private func updateUI() {
        colorModel.setRed(redSlider.value)
        colorModel.setGreen(greenSlider.value)
        colorModel.setBlue(blueSlider.value)

        redValueLabel.text = colorModel.getRedFormatted()
        greenValueLabel.text = colorModel.getGreenFormatted()
        blueValueLabel.text = colorModel.getBlueFormatted()

        colorView.backgroundColor = colorModel.getUIColor()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
        mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
}
