var firstCurrency = Int()
var secondCurrency = Int()

import UIKit

class СhoiceCurrency: UIViewController {

    @IBOutlet weak var segments: UISegmentedControl!
    
    var segmentIndex = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSegments()
    }
    
    @IBAction func segmentsSelected(_ sender: UISegmentedControl) {
        var one = view.self.viewWithTag(sender.tag) as? UISegmentedControl
        if currencyButtonSelected == 0 {
            firstCurrency =  one!.selectedSegmentIndex + segmentIndex[sender.tag-1]
        }
        else {
            secondCurrency =  one!.selectedSegmentIndex + segmentIndex[sender.tag-1]
        }

        disableSegmentsSelected(tag: sender.tag)
    }
    
    func disableSegmentsSelected(tag: Int) {
        
        for x in 1...12 {
                
            guard x != tag else { continue }
                
            var one = view.self.viewWithTag(x) as? UISegmentedControl
            one!.selectedSegmentIndex = UISegmentedControl.noSegment
        }
    }

    func clearSegments() {
        
        for i in 1...12 {
            
            var currentSegment = view.self.viewWithTag(i) as? UISegmentedControl
            currentSegment?.removeAllSegments()
        }
    }

    func updateSegments() {

        clearSegments()

        ForLoop: for i in 1...currencyAbbreviation.count {
            
            switch i {
            case 1...5:
                var one = view.self.viewWithTag(1) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 5...10:
                var one = view.self.viewWithTag(2) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 10...15:
                var one = view.self.viewWithTag(3) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 15...20:
                var one = view.self.viewWithTag(4) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 20...25:
                var one = view.self.viewWithTag(5) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 25...30:
                var one = view.self.viewWithTag(6) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 30...35:
                var one = view.self.viewWithTag(7) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 35...40:
                var one = view.self.viewWithTag(8) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 40...45:
                var one = view.self.viewWithTag(9) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 45...50:
                var one = view.self.viewWithTag(10) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 50...55:
                var one = view.self.viewWithTag(11) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            case 55...60:
                var one = view.self.viewWithTag(12) as? UISegmentedControl
                one!.insertSegment(withTitle: currencyAbbreviation[i-1], at: i, animated: false)
                break
            default:
                break ForLoop
            }
        }
    }
}
