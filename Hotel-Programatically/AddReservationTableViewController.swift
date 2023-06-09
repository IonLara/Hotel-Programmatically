//
//  AddReservationTableViewController.swift
//  Hotel-Programatically
//
//  Created by Ion Sebastian Rodriguez Lara on 09/05/23.
//

import UIKit

protocol AddReservationDelegate: AnyObject {
    func add(_ reservation: Reservation)
}

class AddReservationTableViewController: UITableViewController {
    
    var roomType: RoomType = RoomType.all[0]
    var delegate: AddReservationDelegate?
    
    //Cells Id's
    let textInputCell = "TextInput"
    let firstNameCell = TextInputTableViewCell()
    let lastNameCell = TextInputTableViewCell()
    let emailCell = TextInputTableViewCell()
    let dateLabelCell = "DateLabel"
    let checkInLabelCell = DateLabelTableViewCell()
    let checkOutLabelCell = DateLabelTableViewCell()
    let datePickerCell = "DatePicker"
    let checkInPickerCell = DatePickerTableViewCell()
    let checkOutPickerCell = DatePickerTableViewCell()
    let stepperCell = "Stepper"
    let adultStepperCell = StepperTableViewCell()
    let childrenStepperCell = StepperTableViewCell()
    let switchCell = "Switch"
    let wifiSwitchCell = SwitchTableViewCell()
    let roomTypeCell = "RoomType"
    let roomCell = ChooseRoomTypeTableViewCell()
    
    var isCheckInPickerVisible = false {
        didSet {
            checkInPickerCell.isHidden = !isCheckInPickerVisible
        }
    }
    var isCheckOutPickerVisible = false {
        didSet {
            checkOutPickerCell.isHidden = !isCheckOutPickerVisible
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add Reservation"
        
        tableView.register(TextInputTableViewCell.self, forCellReuseIdentifier: textInputCell)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissViewController))
        // save button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addReservation))
        
        firstNameCell.textField.placeholder = "First Name"
        lastNameCell.textField.placeholder = "Last Name"
        emailCell.textField.placeholder = "Email"
        
        checkInPickerCell.isHidden = true
        checkOutPickerCell.isHidden = true
        
        checkInPickerCell.datePicker.addTarget(self, action: #selector(dateValueChanged(_:)), for: .valueChanged)
        checkOutPickerCell.datePicker.addTarget(self, action: #selector(dateValueChanged(_:)), for: .valueChanged)
        
        checkInPickerCell.datePicker.minimumDate = Calendar.current.startOfDay(for: Date())
        
        adultStepperCell.stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        childrenStepperCell.stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        updateDatePickers()
    }
    
    func updateDatePickers() {
        checkOutPickerCell.datePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInPickerCell.datePicker.date)
        
        checkInLabelCell.detailTextLabel?.text = checkInPickerCell.datePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutLabelCell.detailTextLabel?.text = checkOutPickerCell.datePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    @objc func dateValueChanged(_ sender: UIDatePicker) {
        updateDatePickers()
    }
    
    func updateSteppers() {
        adultStepperCell.number.text = "\(Int(adultStepperCell.stepper.value))"
        childrenStepperCell.number.text = "\(Int(childrenStepperCell.stepper.value))"
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
        updateSteppers()
    }
    
    @objc func addReservation() {
        let reservation = Reservation(firstName: firstNameCell.textField.text ?? "", lastName: lastNameCell.textField.text ?? "", email: emailCell.textField.text ?? "", checkInDate: checkInPickerCell.datePicker.date, checkOutDate: checkOutPickerCell.datePicker.date, numOfAdults: Int(adultStepperCell.stepper.value), numOfChildren: Int(childrenStepperCell.stepper.value), wifi: wifiSwitchCell.wifiSwitch.isOn, roomType: roomType)
        delegate?.add(reservation)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 3
        case 1:
            return 4
        case 2:
            return 2
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == [1,0] && !isCheckOutPickerVisible {
            isCheckInPickerVisible.toggle()
        } else if indexPath == [1,2] && !isCheckInPickerVisible {
            isCheckOutPickerVisible.toggle()
        } else if indexPath == [1,0] || indexPath == [1,2] {
            isCheckInPickerVisible.toggle()
            isCheckOutPickerVisible.toggle()
        } else {
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath {
        case [0,0]:
            return firstNameCell
        case [0,1]:
            return lastNameCell
        case [0,2]:
            return emailCell
        case [1,0]:
            checkInLabelCell.textLabel?.text = "Check In Date"
            return checkInLabelCell
        case [1,1]:
            return checkInPickerCell
        case [1,2]:
            checkOutLabelCell.textLabel?.text = "Check Out Date"
            return checkOutLabelCell
        case [1,3]:
            return checkOutPickerCell
        case [2,0]:
            adultStepperCell.label.text = "Adults"
            return adultStepperCell
        case [2,1]:
            childrenStepperCell.label.text = "Children"
            return childrenStepperCell
        case [3,0]:
            return wifiSwitchCell
        case[4,0]:
            roomCell.textLabel?.text = "Room Type"
            roomCell.detailTextLabel?.text = "Two Queens"
            roomCell.accessoryType = .disclosureIndicator
            return roomCell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: textInputCell, for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = "WIP"
            cell.contentConfiguration = content
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case [1,1] where !isCheckInPickerVisible:
            return 0
        case [1,3] where !isCheckOutPickerVisible:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
}
