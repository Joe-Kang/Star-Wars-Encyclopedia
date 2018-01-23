import UIKit
class PeopleTableViewController: UITableViewController, detailDelegate {
    var people = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllPeople(completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for person in results {
                            let personDict = person as! NSDictionary
                            self.people.append(personDict)
                        }
                    }
                }
                DispatchQueue.main.async {self.tableView.reloadData()}
            } catch {print(error)}
        })
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "personDetailSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
        let personDetailViewController = viewController as! PersonDetailViewController
        personDetailViewController.delegate = self
        let indexPath = sender as! NSIndexPath
        let person = people[indexPath.row]
        personDetailViewController.person = person
    }
    
    func cancelButtonPressed(by controller: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //Contacts A, B, C, D, etc. on the belt exam
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        if let name = people[indexPath.row]["name"] {
            cell.textLabel?.text = name as? String
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
}

