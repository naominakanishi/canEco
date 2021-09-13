import UIKit

class ImpactsView: UIView {

    let impactImage = UIImageView()
    let impactTitle = UILabel()
    
    let benefit: Benefits
    
    init(benefit: Benefits){
        self.benefit = benefit
        super.init(frame: .zero)
        setupImpact()
        setupSize()
        impactTitle.text = benefit.rawValue
        impactImage.image = UIImage(named: benefit.getSymbolName())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImpact(){
        displayImpactImage()
        displayImpactTitle()
    }
    
    func setupSize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 90).isActive = true
        self.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    func displayImpactImage() {
        impactImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(impactImage)
        
        impactImage.backgroundColor = .blue
        
        impactImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        impactImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        impactImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        impactImage.heightAnchor.constraint(equalTo: impactImage.heightAnchor).isActive = true
        
    }
    
    func displayImpactTitle() {
        impactTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(impactTitle)
        
        impactTitle.centerXAnchor.constraint(equalTo: impactImage.centerXAnchor).isActive = true
        impactTitle.widthAnchor.constraint(equalTo: impactImage.widthAnchor).isActive = true
        impactTitle.topAnchor.constraint(equalTo: impactImage.bottomAnchor, constant: 10).isActive = true
        
        impactTitle.font = UIFont.systemFont(ofSize: 12)
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
