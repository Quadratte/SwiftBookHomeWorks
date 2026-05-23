import UIKit

class ViewController: UIViewController {

    // composer
    //let adjustColor = AdjustColorModel()

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

    let redLabel = AppLabel("Red: ", .left)
    let greenLabel = AppLabel("Green: ", .left)
    let blueLabel = AppLabel("Blue: ", .left)

    let redValueLabel = AppLabel("0.50", .center)
    let greenValueLabel = AppLabel("0.50", .center)
    let blueValueLabel = AppLabel("0.50", .center)

    let redSlider = CustomSlider(.red)
    let greenSlider = CustomSlider(.green)
    let blueSlider = CustomSlider(.blue)

    private lazy var redSliderStack = makeSliderStack(labeltext: "Red", slider: redSlider, valueLabel: redValueLabel)
    private lazy var greenSliderStack = makeSliderStack(labeltext: "Green", slider: greenSlider,valueLabel: greenValueLabel)
    private lazy var blueSliderStack = makeSliderStack(labeltext: "Blue", slider: blueSlider, valueLabel: blueValueLabel)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        setupConstraints()
        updateUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainStack)

        mainStack.addArrangedSubview(colorView)
        mainStack.addArrangedSubview(sliderStack)

        sliderStack.addArrangedSubview(redSliderStack)
        sliderStack.addArrangedSubview(greenSliderStack)
        sliderStack.addArrangedSubview(blueSliderStack)
    }

    private func setupActions() {
        redSlider.addAction(UIAction { [weak self] _ in
            self?.sliderValueChanges()
        }, for: .valueChanged)

        greenSlider.addAction(UIAction { [weak self] _ in
            self?.sliderValueChanges()
        }, for: .valueChanged)

        blueSlider.addAction(UIAction { [weak self] _ in
            self?.sliderValueChanges()
        }, for: .valueChanged)

    }

    private func sliderValueChanges() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)

        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }

    // factory method
    private func makeSliderStack(labeltext: String, slider: CustomSlider, valueLabel: AppLabel) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        stack.distribution = .fill

        let label = AppLabel(labeltext, .left)
        label.widthAnchor.constraint(equalToConstant: 50).isActive = true

        valueLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        valueLabel.textAlignment = .center

        stack.addArrangedSubview(label)
        stack.addArrangedSubview(valueLabel)
        stack.addArrangedSubview(slider)

        return stack
    }

    private func updateUI() {

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
