var currencyNames = [String]()
var currencyRates = [String]()
var currencyAbbreviation = [String]()

import UIKit

class CurrencyRates: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let dateFormatter = DateFormatter()
    var selectedDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedDate = getCurrentDate()
        getCurrencyRates()
    }
    
    @IBAction func updateCurrencyRates(_ sender: UIButton) {
        dateFormatter.dateFormat = "yyyyMMdd"
        selectedDate = dateFormatter.string(from: datePicker.date)

        getCurrencyRates()
    }
    
    func getCurrentDate() -> String {
        dateFormatter.dateFormat = "yyyyMMdd"
        selectedDate = dateFormatter.string(from: Date())
        return selectedDate
    }
    
    func getCurrencyRates() {
        
        currencyNames = [String]()
        currencyRates = [String]()
        currencyAbbreviation = [String]()
        
        struct currencyStruct: Decodable {
            enum CodingKeys: String, CodingKey {
                case id = "r030"
                case name = "txt"
                case rate
                case abbreviation = "cc"
                case exchangedate
            }
            let id: Int
            let name: String
            let rate: Float
            let abbreviation: String
            let exchangedate: String
        }
        
        let urlString = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?date=\(selectedDate)&json"
        guard let url = URL(string: urlString) else {return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in if let data = data {
        parseJSON(withData: data)
            }
        }

        task.resume()

        func parseJSON(withData data: Data ) {
            do {
                let currencyData: [currencyStruct] = try! JSONDecoder().decode([currencyStruct].self, from: data)

                for i in 0..<currencyData.count {
                            currencyAbbreviation.insert(String(currencyData[i].abbreviation), at: i)
                            currencyNames.insert(String(currencyData[i].name), at: i)
                            currencyRates.insert(String(format: "%.2f ₴", currencyData[i].rate), at: i)
                    }
                tableViewReload()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

extension CurrencyRates: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyRatesTable", for: indexPath)
        cell.textLabel?.text = currencyNames[indexPath.row] + " (\(currencyAbbreviation[indexPath.row]))"
        cell.detailTextLabel?.text = currencyRates[indexPath.row]
        cell.textLabel?.font = UIFont(name:"Avenir Book", size: 17.0)
        cell.detailTextLabel?.font = UIFont(name:"Avenir Heavy", size: 17.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //Функция для обновления таблицы
    
    func tableViewReload(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

