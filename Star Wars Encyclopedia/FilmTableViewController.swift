import UIKit
class FilmTableViewController: UITableViewController, detailDelegate {
    var films = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllFilms(completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for film in results {
                            let filmDict = film as! NSDictionary
                            self.films.append(filmDict)
                        }
                    }
                }
                DispatchQueue.main.async {self.tableView.reloadData()}
            } catch {
                print(error)
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "filmDetailSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
        let filmDetailViewController = viewController as! FilmDetailViewController
        filmDetailViewController.delegate = self
        let indexPath = sender as! NSIndexPath
        let film = films[indexPath.row]
        filmDetailViewController.film = film
    }
    
    func cancelButtonPressed(by controller: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return films.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        if let title = films[indexPath.row]["title"] {
            cell.textLabel?.text = title as? String
        }
        
        return cell
    }
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
}

