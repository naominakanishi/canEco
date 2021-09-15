import UIKit

class ChecklistView: UIView {
    
    let checklistTitle = UILabel()
    
    let checklistStackView = UIStackView()

    var stepChallenge: StepChallenge
    
    init(stepChallenge: StepChallenge){
        self.stepChallenge = stepChallenge
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
            checklistTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
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
            checklistStackView.topAnchor.constraint(equalTo: checklistTitle.topAnchor, constant: 20),
            checklistStackView.widthAnchor.constraint(equalTo: widthAnchor),
            checklistStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            checklistStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
       
        checklistStackView.distribution = .fillEqually
        checklistStackView.spacing = 5
        checklistStackView.axis = .vertical
        print("mas que cois2a")
        
    }
    
    private func setupChecklistStackView() {
        for step in stepChallenge.steps {
            let checklistItem = ChecklistItemView(info: step)
            checklistStackView.addArrangedSubview(checklistItem)
            print("adicionou")
        }
    }
}



