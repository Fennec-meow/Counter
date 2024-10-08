import UIKit

class ViewController: UIViewController {
    var myCounter: Int = 0
    
    @IBOutlet var counter: UILabel!
    @IBOutlet var counterTitle: UILabel!
    @IBOutlet var counterLog: UITextView!
    @IBOutlet var addAnAccount: UIButton!
    @IBOutlet var minusTheBill: UIButton!
    @IBOutlet var reset: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        displayingLogs("История изменений:", false)
        counter.textAlignment = .center
        counter.textColor = .black
        counter.text = String(myCounter)
        counter.font = UIFont.systemFont(ofSize: 40)
        counterTitle.text = "Значение счетчика:"
        counterTitle.font = UIFont.systemFont(ofSize: 23)
        counterTitle.backgroundColor = .white
        counterTitle.textColor = .black
        counterLog.textColor = .black
        addAnAccount.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        addAnAccount.backgroundColor = .red
        addAnAccount.tintColor = .white
        minusTheBill.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        minusTheBill.backgroundColor = .blue
        minusTheBill.tintColor = .white
    }
    
    func deductTheBill() {
        counter.text = String(myCounter)
    }
    
    func displayingLogs(_ writingText: String, _ recordTheDate: Bool) {
        var currentDateTime: String
        if recordTheDate {
            let date = Date()
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
            currentDateTime = dateFormat.string(from: date) + ": "
        } else {
            currentDateTime = ""
        }
        counterLog.insertText(currentDateTime + writingText + "\n")
    }
    
    @IBAction func add(_ sender: Any) {
        myCounter += 1
        deductTheBill()
        displayingLogs("значение изменено на +1", true)
    }
    
    @IBAction func minus(_ sender: Any) {
        if myCounter >= 1 {
            myCounter -= 1
            deductTheBill()
            displayingLogs("значение изменено на -1", true)
        } else {
            displayingLogs("попытка уменьшить значение счётчика ниже 0", true)
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        myCounter = 0
        deductTheBill()
        displayingLogs("значение сброшено", true)
    }
    
}
