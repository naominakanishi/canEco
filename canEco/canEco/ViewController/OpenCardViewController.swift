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
    
    let contentsScrollView = UIScrollView()
    
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
  
    var isChallengeActive: Bool!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        isChallengeActive = (User.shared.ongoingChallenges.first { $0.name == challenge.name } != nil )
        
        if !isChallengeActive {
            displayAcceptChallengeButton()
        }
        
        displayContentsScrollView()
        
        displayHeader()
        displayChallengeTitle()
        displayPlaceholderInformation()
        displayChallengeDescription()
        displayImpactTitle()
        displayImpactsStackView()
        setupBenefits()
        setupLabels()
        displayTipsTitle()
        displayTipsText()
    }
    
    private func setupBenefits() {
        impactsStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
            impactsStackView.removeArrangedSubview($0)}
        challenge.benefits.forEach {
            let impactsView = ImpactsView(benefit: $0)
            impactsView.associetedStackView = impactsStackView
            impactsStackView.addArrangedSubview(impactsView)
        }
    }
    
    private func setupLabels() {
        challengeTitle.text = challenge.name
        
        challengeDescription.text = "Um texto de no máximo 3 linhas explicando para o usuário o que ele deve fazer para concluir esse desafio incrível."
        
        tipsText.text = "Este é o momento de pirar, mostrando com até 4 linhas o que ele pode fazer para ser bem sucedido (ou sussedido? Gente eu não sei português) o que ele consegue fazer."
    }
    
    private func displayContentsScrollView() {
        contentsScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentsScrollView)
        contentsScrollView.showsVerticalScrollIndicator = false
        
        let bottomConstraint = isChallengeActive ? contentsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor) : contentsScrollView.bottomAnchor.constraint(equalTo: acceptChallengeButton.topAnchor, constant: -15)
        
        
        NSLayoutConstraint.activate([
            contentsScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            contentsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentsScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            bottomConstraint
        ])
        
        print(bottomConstraint)
        
    }
    
    private func displayHeader() {
        header = OpenCardHeaderView (challenge: challenge)
        header.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: contentsScrollView.topAnchor),
            header.leadingAnchor.constraint(equalTo: contentsScrollView.leadingAnchor),
//            header.trailingAnchor.constraint(equalTo: contentsScrollView.trailingAnchor),
//            header.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor),
            header.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor),
            header.heightAnchor
                .constraint(equalToConstant: 300)
        ])
        header.backgroundColor = challenge.category.getColor()
    }
    
    
    private func displayChallengeTitle() {
        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(challengeTitle)

        
        NSLayoutConstraint.activate([
            challengeTitle.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.7),
            challengeTitle.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor),
            challengeTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 15)
        ])

        challengeTitle.textAlignment = .center
        challengeTitle.numberOfLines = 0
        challengeTitle.font = UIFont.boldSystemFont(ofSize: 30)
        challengeTitle.textColor = challenge.category.getColor()
    }
    
    private func displayPlaceholderInformation() {
        placeholderInformation.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(placeholderInformation)
        
        placeholderInformation.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor).isActive = true
        placeholderInformation.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.9).isActive = true
        placeholderInformation.topAnchor.constraint(equalTo: challengeTitle.bottomAnchor, constant: 10).isActive = true
        
        placeholderInformation.numberOfLines = 0
        placeholderInformation.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        placeholderInformation.text = " 87 participantes       4 semanas"
        placeholderInformation.textAlignment = .center
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
        contentsScrollView.addSubview(challengeDescription)
        
        NSLayoutConstraint.activate([

            challengeDescription.topAnchor.constraint(equalTo: placeholderInformation.bottomAnchor, constant: 15),
            challengeDescription.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.8),
            challengeDescription.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor)
         
        ])
        challengeDescription.numberOfLines = 0
        challengeDescription.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
    }
    
    private func displayImpactTitle() {
        impactTitle.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(impactTitle)
        
        impactTitle.topAnchor.constraint(equalTo: challengeDescription.bottomAnchor, constant: 25).isActive = true
        impactTitle.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.7).isActive = true
        impactTitle.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor).isActive = true
        
        impactTitle.numberOfLines = 0
        impactTitle.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        impactTitle.textAlignment = .center
        impactTitle.text = "Impactos positivos"
        impactTitle.textColor = challenge.category.getColor()
    }
    
    func displayImpactsStackView(){
        contentsScrollView.addSubview(impactsStackView)
        impactsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            impactsStackView.topAnchor.constraint(
                equalTo: impactTitle.bottomAnchor,
                constant: 10
            ),
            impactsStackView.widthAnchor.constraint(
                equalTo: contentsScrollView.widthAnchor,
                multiplier: 0.8
            ),
            impactsStackView.centerXAnchor.constraint(
                equalTo: contentsScrollView.centerXAnchor
            ),
            impactsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
//        impactsStackView.distribution = .fillEqually
//        impactsStackView.alignment = .center
        impactsStackView.spacing = view.frame.width * 0.8 * 0.35
        impactsStackView.alignment = .leading
    }
   
    private func displayTipsTitle() {
        tipsTitle.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(tipsTitle)

        
        tipsTitle.topAnchor.constraint(equalTo: impactsStackView.bottomAnchor, constant: 25).isActive = true
        tipsTitle.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.7).isActive = true
        tipsTitle.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor).isActive = true

        tipsTitle.numberOfLines = 0
        tipsTitle.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        tipsTitle.textAlignment = .center
        tipsTitle.text = "Dicas"
        tipsTitle.textColor = challenge.category.getColor()
    }
    
    private func displayTipsText() {
        tipsText.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(tipsText)
        
        NSLayoutConstraint.activate([

            tipsText.bottomAnchor.constraint(equalTo: contentsScrollView.bottomAnchor),
            tipsText.topAnchor.constraint(equalTo: tipsTitle.bottomAnchor, constant: 15),
            tipsText.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.8),
            tipsText.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor)
         
        ])
        tipsText.numberOfLines = 0
        tipsText.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
    }
    
    @objc
    func handleAcceptButton() {
        progressBar.completedStepCount += 1
    }
}
