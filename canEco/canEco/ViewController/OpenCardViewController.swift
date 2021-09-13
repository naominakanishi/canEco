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
    
    var header: OpenCardHeaderView!
    
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
        setupBenefits()
        displayHeader()
       // displayChallengeTitle()
        displayPlaceholderInformation()
        displayAcceptChallengeButton()
        displayChallengeDescription()
        displayImpactTitle()
        displayImpactsStackView()
    }
    
    private func setupBenefits() {
        impactsStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
            impactsStackView.removeArrangedSubview($0)}
        challenge.benefits.forEach {
            let impactsView = ImpactsView(benefit: $0)
            impactsStackView.addArrangedSubview(impactsView)
        }
    }
    
    private func setupLabels() {
        challengeTitle.text = challenge.name
        
        challengeDescription.text = "Um texto de no máximo 3 linhas explicando para o usuário o que ele deve fazer para concluir esse desafio incrível."
    }
    
    private func displayHeader() {
        header = OpenCardHeaderView (challenge: challenge)
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor
                .constraint(equalToConstant: 300)
        ])
        header.backgroundColor = challenge.category.getColor()
    }
    
    
//    private func displayChallengeTitle() {
//        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(challengeTitle)
//
//        challengeTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
//        challengeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        challengeTitle.topAnchor.constraint(equalTo: challengeImage.bottomAnchor, constant: 15).isActive = true
//
//        challengeTitle.textAlignment = .center
//        challengeTitle.numberOfLines = 0
//        challengeTitle.font = UIFont.boldSystemFont(ofSize: 36)
//        challengeTitle.textColor = challenge.category.getColor()
//    }
    
    private func displayPlaceholderInformation() {
        placeholderInformation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeholderInformation)
        
        placeholderInformation.leadingAnchor.constraint(equalTo: header.leadingAnchor).isActive = true
        placeholderInformation.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        placeholderInformation.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        
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
            acceptChallengeButton.widthAnchor.constraint(equalToConstant: 228),
            acceptChallengeButton.heightAnchor.constraint(equalToConstant: 63),
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
    
    private func displayImpactTitle() {
        impactTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(impactTitle)
        
        impactTitle.topAnchor.constraint(equalTo: challengeDescription.bottomAnchor, constant: 25).isActive = true
        impactTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        impactTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        impactTitle.numberOfLines = 0
        impactTitle.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        impactTitle.textAlignment = .center
        impactTitle.text = "Impactos positivos"
        impactTitle.textColor = challenge.category.getColor()
    }
    
    func displayImpactsStackView(){
        impactsStackView.distribution = .fillEqually
        impactsStackView.alignment = .center
        
        view.addSubview(impactsStackView)
        impactsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            impactsStackView.topAnchor.constraint(
                equalTo: impactTitle.bottomAnchor,
                constant: 10
            ),
            impactsStackView.bottomAnchor.constraint(
                equalTo: acceptChallengeButton.topAnchor,
                constant: -20
            ),
            
            impactsStackView.widthAnchor.constraint(
                lessThanOrEqualTo: view.widthAnchor,
                multiplier: 0.8
            ),
            impactsStackView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            )
        ])
    }
   
    private func displayTipsTitle() {
        tipsTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tipsTitle)
        
        tipsTitle.topAnchor.constraint(equalTo: impactsStackView.bottomAnchor, constant: 25).isActive = true
        tipsTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        tipsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        tipsTitle.numberOfLines = 0
        tipsTitle.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        tipsTitle.textAlignment = .center
        tipsTitle.text = "Dicas"
        tipsTitle.textColor = challenge.category.getColor()
    }
    
    @objc
    func handleAcceptButton() {
        progressBar.completedStepCount += 1
    }
}
