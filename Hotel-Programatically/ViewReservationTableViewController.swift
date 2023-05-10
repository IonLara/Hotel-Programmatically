//
//  ViewReservationTableViewController.swift
//  Hotel-Programatically
//
//  Created by Ion Sebastian Rodriguez Lara on 09/05/23.
//

import UIKit

class ViewReservationTableViewController: UITableViewController, AddReservationDelegate {
    func add(_ reservation: Reservation) {
        reservations.append(reservation)
        tableView.insertRows(at: [IndexPath(row: reservations.count - 1, section: 0)], with: .automatic)
    }
    
    
    var reservations : [Reservation] = [Reservation(firstName: "Sampleton", lastName: "Fakeson", email: "notreal@gmail.com", checkInDate: Date(), checkOutDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, numOfAdults: 1, numOfChildren: 0, wifi: true, roomType: RoomType.all[0])]
    let cellId = "ReservationCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Reservations"
        tableView.register(ViewReservationCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewReservation))
    }
    
    func navigateToAddReservation() {
        let addResTVC = AddReservationTableViewController(style: .grouped)
        addResTVC.delegate = self
        let addResNC = UINavigationController(rootViewController: addResTVC)
        present(addResNC, animated: true, completion: nil)
//        let addEditTVC = AddEditEmojiTableViewController(style: .grouped)
//        addEditTVC.delegate = self
//        let addEditNC = UINavigationController(rootViewController: addEditTVC)
//        present(addEditNC, animated: true, completion: nil)
    }
    
    @objc func addNewReservation() {
        navigateToAddReservation()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reservations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        var content = cell.defaultContentConfiguration()
        let reservation = reservations[indexPath.row]
        content.text = "\(reservation.firstName) \(reservation.lastName)"
        let inString = reservation.checkInDate.formatted(date: .numeric, time: .omitted)
        let outString = reservation.checkOutDate.formatted(date: .numeric, time: .omitted)
        content.secondaryText = "\(inString)-\(outString): \(reservation.roomType.name)"
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: -

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
