import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var turnButton: UIButton!
    
    
    var globalTimer = Timer()
    var redTimer = Timer()
    var yellowTimer = Timer()
    var greenTimer = Timer()
    var secondGreenTimer = Timer()
    
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lightsDisign()
        stopLights()
        
    }

    @IBAction func turnButtonPressed(_ sender: UIButton) {
        
        if flag == false {
            flag = true
            turnButton.titleLabel?.text = "Turn off"
            self.lightsWorks()
        } else {
            flag = false
            stopLights()
            turnButton.titleLabel?.text = "Turn on"
        }
    }
    
    private func lightsDisign() {
        redView.layer.cornerRadius = redView.frame.height/2
        yellowView.layer.cornerRadius = yellowView.frame.height/2
        greenView.layer.cornerRadius = greenView.frame.height/2
    }
    
    private func stopLights() {
        redView.isHidden = true
        yellowView.isHidden = true
        greenView.isHidden = true
        redTimer.invalidate()
        yellowTimer.invalidate()
        greenTimer.invalidate()
        
        
        yellowTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.yellowFlicker()
        }
        yellowTimer.fire()

    }
    
    private func redFlicker() {
        if redView.isHidden == true {
            self.redView.isHidden = false
        } else {
            self.redView.isHidden = true
        }
    }
    
    private func yellowFlicker() {
        if yellowView.isHidden == true {
            yellowView.isHidden = false
        } else {
            yellowView.isHidden = true
        }
    }
    
    private func greenFlicker() {
        if greenView.isHidden == true {
            greenView.isHidden = false
        } else {
            greenView.isHidden = true
        }
    }
    
    private func lightsWorks() {
        
        globalTimer = Timer(timeInterval: 12, repeats: true, block: { _ in
            self.redTimer.invalidate()
            self.yellowTimer.invalidate()
            self.greenTimer.invalidate()
            
            self.redView.isHidden = false
            self.yellowView.isHidden = true
            self.greenView.isHidden = true
            
            self.redTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { _ in
                self.redFlicker()
                self.yellowFlicker()
                self.greenFlicker()
            })
            
            self.yellowTimer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in
                self.yellowFlicker()
            })
            
            self.greenTimer = Timer.scheduledTimer(withTimeInterval: 8, repeats: false, block: { _ in
                self.secondGreenTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                    self.greenFlicker()
                    }
                self.secondGreenTimer.fire()
            })
            
            _ = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
                self.secondGreenTimer.invalidate()
                self.greenView.isHidden = true
                self.yellowFlicker()
            }
        })
        greenTimer.fire()
        
    }
}

