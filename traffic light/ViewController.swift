import UIKit

enum CurrentColor {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var turnButton: UIButton!
    var color = CurrentColor.red
    var lightsOff : CGFloat = 0.3
    var lightsOn : CGFloat = 1
    
    @IBOutlet weak var leftConstraintRedView: NSLayoutConstraint!
    @IBOutlet weak var rightConstraintRedView: NSLayoutConstraint!
    
    //MARK: lifecycles funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lightsDisign()
    }
    
    //MARK: IBActions
    @IBAction func turnButtonPressed(_ sender: UIButton) {
        switchLights()
    }
    
    
    private func lightsDisign() {
        leftConstraintRedView.constant = self.view.frame.size.width/4
        rightConstraintRedView.constant = self.view.frame.size.width/4
        
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
        
        redView.alpha = lightsOff
        yellowView.alpha = lightsOff
        greenView.alpha = lightsOff
    }
    
    private func switchLights() {
        
//        turnButton.titleLabel?.text = "Next"
        turnButton.setTitle("Next", for: .normal)
//        turnButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        
        
        switch color {
        case .red:
            greenView.alpha = lightsOff
            redView.alpha = lightsOn
            color = .yellow
        case .yellow:
            redView.alpha = lightsOff
            yellowView.alpha = lightsOn
            color = .green
        case .green:
            yellowView.alpha = lightsOff
            greenView.alpha = lightsOn
            color = .red
        }
    }
    
}
