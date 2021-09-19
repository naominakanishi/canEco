import UIKit

protocol OpenCardViewControllerDelegate: AnyObject {
    func didUpdateChallenges()
}

final class OpenCardViewController: UIViewController {
    
    private let challenge: Challenge
    
    init(challenge: Challenge) {
        self.challenge = challenge
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var challengeDelegate: OpenCardViewControllerDelegate?
    
    lazy var header: OpenCardHeaderView = OpenCardHeaderView (challenge: challenge)
    
    let contentsScrollView = UIScrollView()
    
    let challengeTitle = UILabel()
    
    let placeholderInformation = UILabel()
    
    let challengeDescription = UILabel()
    
    let impactTitle = UILabel()
    let impactsStackView = UIStackView ()
    
    let tipsTitle = UILabel()
    let tipsText = UILabel()
    
    let acceptChallengeButton = UIButton()
    
    let leaveChallengeButton = UIButton()
    
    let separatorView = UIView()
    
    let stepsTitle = UILabel()
    
    let verticalSpacing: CGFloat = 15
    
    var checklistStackView: ChecklistView?
  
    var isChallengeActive: Bool!
    
    var delegate: NewChallengeViewController?
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        isChallengeActive = (User.shared.ongoingChallenges.first { $0.name == challenge.name } != nil )
       
        addSubviews()
        
        if let stepChallenge = challenge as? StepChallenge {
            checklistStackView = ChecklistView(stepChallenge: stepChallenge) { direction in
                switch direction {
                    case .backwards:
                        User.shared.rewind(in: stepChallenge)
                    case .forward:
                        User.shared.progress(in: stepChallenge)
                }
                self.header.progressBar?.completedStepCount = stepChallenge.completedSteps
                self.challengeDelegate?.didUpdateChallenges()
            }
            checklistStackView?.translatesAutoresizingMaskIntoConstraints = false
            contentsScrollView.addSubview(checklistStackView!)
        } else {
            impactTitle.topAnchor.constraint(equalTo: challengeDescription.bottomAnchor, constant: 25).isActive = true
        }
        
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
        displayChecklist()
       
        
        if isChallengeActive {
            displayLeaveChallengeButton()
            displaySeparatorView()
        } else {
            displayAcceptChallengeButton()
        }
        
        displayContentsScrollView()
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
        
        challengeDescription.text = challenge.shortDescription
        
        tipsText.text = challenge.tip
    }
    
    private func addSubviews() {
        contentsScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentsScrollView)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(header)
        
        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(challengeTitle)

        placeholderInformation.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(placeholderInformation)
        
        challengeDescription.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(challengeDescription)
        
        impactTitle.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(impactTitle)
        
        contentsScrollView.addSubview(impactsStackView)
        impactsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        tipsTitle.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(tipsTitle)
        
        tipsText.translatesAutoresizingMaskIntoConstraints = false
        contentsScrollView.addSubview(tipsText)
        
        if isChallengeActive {
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            contentsScrollView.addSubview(separatorView)
            
            leaveChallengeButton.translatesAutoresizingMaskIntoConstraints = false
            contentsScrollView.addSubview(leaveChallengeButton)
        } else {
            acceptChallengeButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(acceptChallengeButton)
        }
    }
    
    private func displayContentsScrollView() {
        contentsScrollView.showsVerticalScrollIndicator = false
        
        let bottomConstraint = isChallengeActive ? contentsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor) : contentsScrollView.bottomAnchor.constraint(
                equalTo: acceptChallengeButton.bottomAnchor,
                constant: -63 - 20
            )
        
        
        NSLayoutConstraint.activate([
            contentsScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            contentsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentsScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            bottomConstraint
        ])
    }
 
    
    private func displayHeader() {
        
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

        
        NSLayoutConstraint.activate([
            challengeTitle.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.7),
            challengeTitle.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor),
            challengeTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: verticalSpacing)
        ])

        challengeTitle.textAlignment = .center
        challengeTitle.numberOfLines = 0
        challengeTitle.font = UIFont(name: "Ubuntu-Bold", size: 30)
        challengeTitle.textColor = challenge.category.getColor()
    }
    
    private func displayPlaceholderInformation() {
        
        placeholderInformation.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor).isActive = true
        placeholderInformation.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.9).isActive = true
        placeholderInformation.topAnchor.constraint(equalTo: challengeTitle.bottomAnchor, constant: 10).isActive = true
        
        placeholderInformation.numberOfLines = 0
        placeholderInformation.font = UIFont(name: "Ubuntu-Regular", size: 14)
        placeholderInformation.textColor = .lightGray
        placeholderInformation.text = " 87 participantes       4 semanas"
        placeholderInformation.textAlignment = .center
    }
    
    private func displayAcceptChallengeButton() {
        acceptChallengeButton.setTitle("Topar Desafio", for: .normal)
        acceptChallengeButton.backgroundColor = challenge.category.getColor()
        
        acceptChallengeButton.addTarget(self, action: #selector(handleAcceptButton), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            acceptChallengeButton.widthAnchor.constraint(equalToConstant: 333),
            acceptChallengeButton.heightAnchor.constraint(equalTo: acceptChallengeButton.widthAnchor, multiplier: 63/333),
            acceptChallengeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            acceptChallengeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -verticalSpacing),
        ])
        
        acceptChallengeButton.setTitle("ACEITAR DESAFIO", for: .normal)
        acceptChallengeButton.titleLabel?.font = UIFont(name: "Ubuntu", size: 20)
        acceptChallengeButton.layer.cornerRadius = 16
    }
    
    private func displayChallengeDescription() {
        
        NSLayoutConstraint.activate([

            challengeDescription.topAnchor.constraint(equalTo: placeholderInformation.bottomAnchor, constant: verticalSpacing),
            challengeDescription.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.8),
            challengeDescription.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor)
         
        ])
        challengeDescription.numberOfLines = 0
        challengeDescription.font = UIFont(name: "Ubuntu", size: 16)
        
    }
    
    private func displayChecklist() {
        
        NSLayoutConstraint.activate([
            checklistStackView!.topAnchor.constraint(equalTo: challengeDescription.bottomAnchor, constant: verticalSpacing),
            checklistStackView!.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.8),
            checklistStackView!.bottomAnchor.constraint(equalTo: impactTitle.topAnchor, constant: -verticalSpacing),
            checklistStackView!.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor)
            
        ])
        
    }
    
    private func displayImpactTitle() {
        
        NSLayoutConstraint.activate([
            impactTitle.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.7),
            impactTitle.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor)
        ])
    
        impactTitle.numberOfLines = 0
        impactTitle.font = UIFont(name: "Ubuntu-Bold", size: 20)
        impactTitle.textAlignment = .center
        impactTitle.text = "Impactos positivos"
        impactTitle.textColor = challenge.category.getColor()
    }
    
    private func displayImpactsStackView(){
        
        
        
        NSLayoutConstraint.activate([
            impactsStackView.topAnchor.constraint(
                equalTo: impactTitle.bottomAnchor,
                constant: verticalSpacing
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

        NSLayoutConstraint.activate([
            tipsTitle.topAnchor.constraint(equalTo: impactsStackView.bottomAnchor, constant: verticalSpacing),
            tipsTitle.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.7),
            tipsTitle.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor),
        ])
        
        tipsTitle.numberOfLines = 0
        tipsTitle.font = UIFont(name: "Ubuntu-bold", size: 20)
        tipsTitle.textAlignment = .center
        tipsTitle.text = "Dicas"
        tipsTitle.textColor = challenge.category.getColor()
    }
    
    private func displayTipsText() {
        
        NSLayoutConstraint.activate([
            tipsText.topAnchor.constraint(equalTo: tipsTitle.bottomAnchor, constant: verticalSpacing),
            tipsText.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.8),
            tipsText.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor),
         
        ])
        
        if !isChallengeActive {
            
            tipsText.bottomAnchor.constraint(equalTo: contentsScrollView.bottomAnchor).isActive = true
        }
        
        tipsText.numberOfLines = 0
        tipsText.font = UIFont(name: "Ubuntu", size: 16)
        
    }
    
    private func displaySeparatorView() {
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: tipsText.bottomAnchor, constant: verticalSpacing*2.2),
            separatorView.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.8),
            separatorView.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        separatorView.backgroundColor = UIColor(named: "black")?.withAlphaComponent(0.2)
    }
    
    private func displayLeaveChallengeButton() {
        
        NSLayoutConstraint.activate([
            leaveChallengeButton.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: verticalSpacing),
            leaveChallengeButton.widthAnchor.constraint(equalTo: contentsScrollView.widthAnchor, multiplier: 0.8),
            leaveChallengeButton.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor),
            leaveChallengeButton.bottomAnchor.constraint(equalTo: contentsScrollView.bottomAnchor)
        ])
        
        leaveChallengeButton.setTitle("Desistir do Challenge", for: .normal)
        leaveChallengeButton.titleLabel?.font = UIFont(name: "Ubuntu", size: 16)
        leaveChallengeButton.setTitleColor(UIColor(named: "accentWarning"), for: .normal)
        
        leaveChallengeButton.addTarget(self, action: #selector(handleLeaveChallengeButton), for: .touchUpInside)
        
    }
    
    
    @objc
    func handleLeaveChallengeButton() {
        let alert = UIAlertController(title: "Você tem certeza que deseja desistir?", message: "Você perderá o progresso que teve até o momento.", preferredStyle: .alert)
        alert.addAction(.init(title: "Cancelar", style: .cancel, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(.init(title: "Sim, desistir", style: .destructive, handler: { _ in
            User.shared.leave(challenge: self.challenge)
            self.challengeDelegate?.didUpdateChallenges()
            self.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
        
    }
  
    @objc
    func handleAcceptButton() {
        User.shared.begin(challenge: challenge)
        challengeDelegate?.didUpdateChallenges()
        dismiss(animated: true, completion: nil)
        
        if let del = delegate {
            del.filterData()
        }
    }

}
