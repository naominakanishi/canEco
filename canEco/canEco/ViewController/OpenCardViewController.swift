import UIKit

final class OpenCardViewController: UIViewController {
    
    
    private let challenge: Challenge
    
    init(challenge: Challenge) {
        self.challenge = challenge
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let challengeImage = UIImage()
    let challengeTitle = UILabel()
    
    let placeholderInformation = UILabel()
    
    let challengeDescription = UILabel()
    
    let impactTitle = UILabel()
    let impactsStackView = UIStackView ()
    
    let tipsTitle = UILabel()
    let tipsText = UILabel()
    
    let acceptChallengeButton = UIButton()
    
    let stepsTitle = UILabel()

    let progressBar: ProgressBar = {
        let progressBar = ProgressBar()
        progressBar.emptyColor = UIColor(white: 0x33/0xff, alpha: 0.2)
        progressBar.highlightColor = UIColor(white: 1, alpha: 0.4)
        return progressBar
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = challenge.category.getColor()
        displayProgressBar()
        displayAcceptChallengeButton()
    }
    
    private func displayProgressBar() {
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressBar)
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 10)
        ])
        
    }
    
    private func displayAcceptChallengeButton() {
        acceptChallengeButton.setTitle("Topar Desafio", for: .normal)
        acceptChallengeButton.backgroundColor = .blue
        acceptChallengeButton.translatesAutoresizingMaskIntoConstraints = false
        
        acceptChallengeButton.addTarget(self, action: #selector(handleAcceptButton), for: .touchUpInside)
        
        view.addSubview(acceptChallengeButton)
        
        NSLayoutConstraint.activate([
            acceptChallengeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            acceptChallengeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc
    func handleAcceptButton() {
        progressBar.completedStepCount += 1
    }
}
