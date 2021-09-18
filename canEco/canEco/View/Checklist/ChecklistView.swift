import UIKit

class ChecklistView: UIView {
    typealias TapCallback = ((Direction) -> Void)
    
    let checklistTitle = UILabel()
    
    let checklistStackView = UIStackView()

    var stepChallenge: StepChallenge
    var associatedProgressBar: ProgressBar?
    let tapCallback: TapCallback
    var checklistItems: [ChecklistItemView] = []
    
    init(stepChallenge: StepChallenge, tapCallback: @escaping TapCallback) {
        self.stepChallenge = stepChallenge
        self.tapCallback = tapCallback
        super.init(frame: .zero)
        displayChecklistTitle()
        displayChecklistStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func displayChecklistTitle() {
        checklistTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(checklistTitle)
        
        NSLayoutConstraint.activate([
            checklistTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            checklistTitle.topAnchor.constraint(equalTo: topAnchor),
            checklistTitle.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        checklistTitle.text = "Seu progresso"
        checklistTitle.font = UIFont(name: "Ubuntu-Bold", size: 20)
        checklistTitle.textColor = stepChallenge.category.getColor()
        checklistTitle.textAlignment = .center
        
        
    }
    
    private func displayChecklistStackView() {
        
        checklistStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(checklistStackView)
        
        setupChecklistStackView()
        
        NSLayoutConstraint.activate([
            checklistStackView.topAnchor.constraint(equalTo: checklistTitle.bottomAnchor, constant: 15),
            checklistStackView.widthAnchor.constraint(equalTo: widthAnchor),
            checklistStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            checklistStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
       
        checklistStackView.distribution = .fillEqually
        checklistStackView.spacing = 5
        checklistStackView.axis = .vertical
        
    }
    
    private func setupChecklistStackView() {
        for (i, _) in stepChallenge.steps.enumerated() {
            let checklistItem = ChecklistItemView(challenge: stepChallenge, stepIndex: i)
            checklistItem.delegate = self
            checklistItems.append(checklistItem)
            checklistStackView.addArrangedSubview(checklistItem)
        }
    }
}

extension ChecklistView: CheckListItemViewDelegate {
    func handleItemTapped(_ view: ChecklistItemView, _ direction: Direction) {
        tapCallback(direction)
        view.setupLayout()
        if view.stepIndex < checklistItems.count - 1 {
            checklistItems[view.stepIndex+1].setupLayout()
        }
    }
}


