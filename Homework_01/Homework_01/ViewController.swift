import UIKit

class ViewController: UIViewController {

    let greenView = CustomView(.green)
    let redView = CustomView(.red)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("View did layout subviews")
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(greenView)
        view.addSubview(redView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            greenView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            greenView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            greenView.heightAnchor.constraint(equalTo: redView.heightAnchor),

            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            redView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
}
