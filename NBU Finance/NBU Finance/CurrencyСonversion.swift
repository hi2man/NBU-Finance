var currencyButtonSelected = 0

import UIKit

class CurrencyConversion: UIViewController {

    @IBOutlet weak var firstCurrencyField: UITextField!
    @IBOutlet weak var secondCurrencyField: UITextField!

    @IBOutlet weak var currencyConversionSum: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var sumConversion: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        firstCurrencyField.text = currencyAbbreviation[firstCurrency]
        secondCurrencyField.text = currencyAbbreviation[secondCurrency]
    }

    //Скрытие клавиаутуры при любом нажатии
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func firstCurrencyButton(_ sender: UIButton) {

        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "СhoiceCurrency") as! СhoiceCurrency
        self.navigationController?.pushViewController(controller, animated: true)
        
        currencyButtonSelected = 0
    }
    
    @IBAction func secondCurrencyButton(_ sender: UIButton) {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "СhoiceCurrency") as! СhoiceCurrency
        self.navigationController?.pushViewController(controller, animated: true)
        
        currencyButtonSelected = 1
    }
    @IBAction func sumSelected(_ sender: UITextField) {
        sumConversion = Float(currencyConversionSum.text!)!
    }
    @IBAction func convertButton(_ sender: UIButton) {
        let firstCurrencyRate = Float(currencyRates[firstCurrency].trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted))
        let secondCurrencyRate = Float(currencyRates[secondCurrency].trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted))
        
        resultLabel.text = String(NSString(format: "%.2f", (firstCurrencyRate!*sumConversion)/secondCurrencyRate!))
    }
}
