import UIKit

final class OpenCardViewController: UIViewController {
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
    
    
    let progressBar = ProgressBar()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
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

