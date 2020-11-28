import UIKit

var names = ["Vegetables": ["Tomato", "Potato", "Lettuce"], "Fruits": ["Apple", "Banana"]]

struct Objects {
    
    var sectionName : String!
    var sectionObjects : [String]!
}

var objectArray = [Objects]()

for key in names {
    print("\(key)")
}

for (key, value) in names {
    print("\(key) -> \(value)")
    objectArray.append(Objects(sectionName: key, sectionObjects: value))
}

// MARK: - Table view data source

print(objectArray.count)

func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objectArray[section].sectionObjects.count
}

for value in objectArray {
    print(value)
}
//override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
//
//    // Configure the cell...
//    cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
//    return cell
//}
//
//override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//    return objectArray[section].sectionName
//}
