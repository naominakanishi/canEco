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
    
    let challengeImage = UIImageView()
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
        view.backgroundColor = .white
   //     displayProgressBar()
        setupLabels()
        displayChallengeImage()
        displayChallengeTitle()
        displayPlaceholderInformation()
        displayAcceptChallengeButton()
        displayChallengeDescription()
    }
    
    private func setupLabels() {
        challengeTitle.text = challenge.name
        challengeImage.image = UIImage(named: "placeholder")
        challengeDescription.text = "Um texto de no máximo 3 linhas explicando para o usuário o que ele deve fazer para concluir esse desafio incrível."
    }
    
    private func displayChallengeImage() {
        challengeImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(challengeImage)
        
        NSLayoutConstraint.activate([
            challengeImage.topAnchor.constraint(equalTo: view.topAnchor),
            challengeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            challengeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            challengeImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        challengeImage.backgroundColor = challenge.category.getColor()
        
    }
    
    private func displayChallengeTitle() {
        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(challengeTitle)
        
        challengeTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        challengeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        challengeTitle.topAnchor.constraint(equalTo: challengeImage.bottomAnchor, constant: 15).isActive = true
        
        challengeTitle.textAlignment = .center
        challengeTitle.numberOfLines = 0
        challengeTitle.font = UIFont.boldSystemFont(ofSize: 36)
        challengeTitle.textColor = challenge.category.getColor()
    }
    
    
    private func displayPlaceholderInformation() {
        placeholderInformation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeholderInformation)
        
        placeholderInformation.leadingAnchor.constraint(equalTo: challengeTitle.leadingAnchor).isActive = true
        placeholderInformation.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        placeholderInformation.topAnchor.constraint(equalTo: challengeTitle.bottomAnchor, constant: 10).isActive = true
        
        placeholderInformation.numberOfLines = 0
        placeholderInformation.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        placeholderInformation.text = " 87 participantes       4 semanas"
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
        acceptChallengeButton.backgroundColor = challenge.category.getColor()
        acceptChallengeButton.translatesAutoresizingMaskIntoConstraints = false
        
        acceptChallengeButton.addTarget(self, action: #selector(handleAcceptButton), for: .touchUpInside)
        
        view.addSubview(acceptChallengeButton)
        
        NSLayoutConstraint.activate([
            acceptChallengeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.76),
            acceptChallengeButton.heightAnchor.constraint(equalTo: acceptChallengeButton.widthAnchor, multiplier: 63/228),
            acceptChallengeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            acceptChallengeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
        acceptChallengeButton.setTitle("ACEITAR DESAFIO", for: .normal)
        acceptChallengeButton.layer.cornerRadius = 16
    }
    
    private func displayChallengeDescription() {
        challengeDescription.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(challengeDescription)
        
        NSLayoutConstraint.activate([

            challengeDescription.topAnchor.constraint(equalTo: placeholderInformation.bottomAnchor, constant: 15),
            challengeDescription.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            challengeDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor)
         
        ])
        challengeDescription.numberOfLines = 0
        challengeDescription.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
    }
    
   
    
    @objc
    func handleAcceptButton() {
        progressBar.completedStepCount += 1
    }
}
