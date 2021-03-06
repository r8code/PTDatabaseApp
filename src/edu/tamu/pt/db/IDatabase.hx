package edu.tamu.pt.db;

import edu.tamu.pt.struct.ClassSchedule;
import edu.tamu.pt.struct.PeerTeacher;

/** IDatabase Interface
 *  @author  Timothy Foster
 *
 *  Interface for all implementations of a database.  This allows for quick
 *  and easy access to the important information a database holds, but it
 *  does not allow for generic queries.
 *  **************************************************************************/
interface IDatabase  {
/**
 *  Loads a database given the specs.  Returns true if the load succeeds.
 *  @param specs Specifications for opening the correct database.  This is Dynamic since knowing what specs are needed is implementation-dependent.
 *  @return true if the load succeeds, false otherwise.  If false, error() will return the error message.
 */
    public function load(specs:Dynamic):Bool;
    
/**
 *  Saves the database's current state to the persistance module.
 *  @param specs Specifications for saving to the correct database.  By default, same specs used by load will be used here.
 *  @return true if the save succeeds, false otherwise.  If false, error() will return the error message.
 */
    public function save(?specs:Dynamic):Bool;
    
/**
 *  If an error occurs in the database, this method will return the error message as a String.
 *  @return The error message.
 */
    public function error():String;
    
/**
 *  Retrieves a single PeerTeacher from the database given a name of the form "FIRSTNAME LASTNAME".
 *  @param name The PeerTeacher's name as "FIRSTNAME LASTNAME"
 *  @return null if the PT could not be found.
 */
    public function pt(name:String):PeerTeacher;
    
/**
 *  Batch retrieve of peer teachers.  The list can be abbreviated with a filter and sorted with a sorter, but both arguments are optional.  By default, this will return every single PT in the database in any order.
 *  @param filter The filter will filter out undesired peer teachers, such as any peer teacher's whose schedules are incompatible with a particular appointment.  The function should return true if the PT is desired.
 *  @param sorter The sorter will sort the filtered list according to some schema. The sorter should return -1 if lhs < rhs, 1 if lhs > rhs, and 0 if lhs == rhs.
 *  @return Array of PeerTeachers matching the filter, in sorted order according to sorter.
 */
    public function pts(?filter:PeerTeacher->Bool, ?sorter:PeerTeacher->PeerTeacher->Int):Array<PeerTeacher>;
    
/**
 *  Returns a single lab schedule given the full code (eg. CSCE-121-501).
 *  @param code The lab's code in the form DEPT-CODE-SECTION
 *  @return null if the schedule could not be found
 */
    public function lab(code:String):ClassSchedule;
    
/**
 *  Batch retrieve of lab schedules.  The list can be abbreviated with a filter and sorted with a sorter, but both arguments are optional.  By default, this will return every single lab in unspecified order.
 *  @param filter The filter will filter out undesired labs.  The function should return true if the lab is desired.
 *  @param sorter The sorter will sort the filtered list according to some schema. The sorter should return -1 if lhs < rhs, 1 if lhs > rhs, and 0 if lhs == rhs.
 *  @return Array of ClassSchedules matching the filter, in sorted order according to the sorter
 */
    public function labs(?filter:ClassSchedule->Bool, ?sorter:ClassSchedule->ClassSchedule->Int):Array<ClassSchedule>;
    
/**
 *  Adds a PT to the database.
 *  @param pt PeerTeacher to add.
 */
    public function addPT(pt:PeerTeacher):Void;
    
/**
 *  Removes the PT from the database.  If you need to remove by name, call remove(pt(name)).
 *  @param pt PeerTeacher to remove.
 */
    public function removePT(pt:PeerTeacher):Void;
    
/**
 *  Adds a lab to the database.
 *  @param lab A ClassSchedule object describing a lab
 */
    public function addLab(lab:ClassSchedule):Void;
    
/**
 *  Removes the Lab from the database.  If you need to remove by name, call remove(lab(name)).
 *  @param lab A ClassSchedule object describing a lab
 */
    public function removeLab(lab:ClassSchedule):Void;
    
/**
 *  Wipes the database of peer teachers.  They don't die in real life, just digitally.
 */
    public function clearPts():Void;
    
/**
 *  Wipes the database of labs.  Every student's dream.
 *  
 *  This must ALSO wipe all lab assignments for PTs in the database.  Otherwise, students can be
 *  assigned to nonexistent labs, almost certainly a recipe for bugs.
 */
    public function clearLabs():Void;
    
/**
 *  Wipes the database of everything.
 */
    public function clearAll():Void;
}