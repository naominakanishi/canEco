import UIKit

class ImpactsView: UIView {

    let impactImage = UIImageView()
    let impactTitle = UILabel()
    
    let benefit: Benefits
    var associetedStackView: UIStackView!
    
    init(benefit: Benefits){
        self.benefit = benefit
        super.init(frame: .zero)
//        setupImpact()
//        setupSize()
        impactTitle.text = benefit.rawValue
        impactImage.image = UIImage(systemName: benefit.getSymbolName())
        impactImage.tintColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        setupImpact()
    }
    
    func setupImpact(){
        displayImpactTitle()
        displayImpactImage()
    }
//
    func setupSize() {
        self.translatesAutoresizingMaskIntoConstraints = false
//        self.widthAnchor.constraint(equalToConstant: 90).isActive = true
//        self.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    func displayImpactImage() {
        impactImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(impactImage)
        
        impactImage.centerXAnchor.constraint(equalTo: impactTitle.centerXAnchor).isActive = true
        impactImage.topAnchor.constraint(equalTo: associetedStackView.topAnchor).isActive = true
        impactImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        impactImage.heightAnchor.constraint(equalTo: impactImage.widthAnchor).isActive = true
        impactImage.bottomAnchor.constraint(equalTo: impactTitle.topAnchor, constant: -10).isActive = true
    }
    
    func displayImpactTitle() {
        impactTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(impactTitle)
        
        impactTitle.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        impactTitle.widthAnchor.constraint(equalTo: associetedStackView.widthAnchor, multiplier: 0.3).isActive = true
        impactTitle.bottomAnchor.constraint(equalTo: associetedStackView.bottomAnchor).isActive = true
        
        impactTitle.font = UIFont(name: "Ubuntu-Regular", size: 12)
        impactTitle.textAlignment = .center
        impactTitle.numberOfLines = 0
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
