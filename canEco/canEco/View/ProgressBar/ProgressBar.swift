import UIKit

protocol ProgressBarDelegate: AnyObject {
    func onProgressBarFilled()
}

final class ProgressBar: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var emptyColor: UIColor = .lightGray {
        didSet {
            drawProgressBar()
        }
    }
    var highlightColor: UIColor {
        didSet {
            drawProgressBar()
        }
    }
    var stepCount: Int {
        didSet {
            drawProgressBar()
        }
    }
    var completedStepCount: Int = 0 {
        didSet {
            drawProgressBar()
        }
    }
    
    weak var delegate: ProgressBarDelegate?
    
    init(
        highlightColor: UIColor = .blue,
        stepCount: Int = 4
    ) {
        self.highlightColor = highlightColor
        self.stepCount = stepCount
        super.init(frame: .zero)
        displayStackView()
        drawProgressBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        drawProgressBar()
    }
}

// MARK: - Display methods
private extension ProgressBar {
    func displayStackView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func drawProgressBar() {
        stackView.arrangedSubviews.forEach { stackView.removeArrangedSubview($0) }
        
        for i in 0..<stepCount {
            let backgroundColor = i < completedStepCount ? highlightColor : emptyColor
            createStep(with: backgroundColor)
        }
        
    }
    
    func createStep(with color: UIColor) {
        let stepView = UIView()
        stackView.addArrangedSubview(stepView)
        stepView.layer.cornerRadius = stackView.frame.size.height / 2
        stepView.backgroundColor = color
    }
}
