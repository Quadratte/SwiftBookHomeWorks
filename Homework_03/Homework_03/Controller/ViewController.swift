import UIKit

class ViewController: UIViewController {

    // composer
    let adjustColor = AdjustColorModel()

    let colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let redLabel = AppLabel("Red: ", .left)
    let greenLabel = AppLabel("Green: ", .left)
    let blueLabel = AppLabel("Blue: ", .left)

    let redValueLabel = AppLabel("0", .center)
    let greenValueLabel = AppLabel("0", .center)
    let blueValueLabel = AppLabel("0", .center)

    let redSlider = CustomSlider(.red)
    let greenSlider = CustomSlider(.green)
    let blueSlider = CustomSlider(.blue)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        setupConstraints()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(colorView)
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
    }

    private func setupActions() {

    }

    private func adjustColorValues() {
        redValueLabel.text = "\(adjustColor.value)"
        greenValueLabel.text = "\(adjustColor.value)"
        blueValueLabel.text = "\(adjustColor.value)"
    }

    private func setupConstraints() {

    }
}
