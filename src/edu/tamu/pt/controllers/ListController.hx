package edu.tamu.pt.controllers;

import haxe.ui.toolkit.containers.TableView;

import edu.tamu.pt.db.IDatabase;
import edu.tamu.pt.util.Sorters;

/** ListController Class
 *  @author  Timothy Foster
 *  @version x.xx.160303
 *  
 *  Shows a list in the form of a table.
 * 
 *  @TODO remove the clicking functionality
 *  **************************************************************************/
class ListController extends Controller {

/*  Constructor
 *  =========================================================================*/
/**
 *  Constructs a new ListController
 *  @param xmlpath Path to the XML view
 *  @param db Reference to the database
 *  @param tableID The id of the table in the XML view
 */
    public function new(xmlpath:String, db:IDatabase, tableID:String) {
        super(xmlpath, db);
        table = getComponentAs(tableID, TableView);
    }
 
/*  Public Methods
 *  =========================================================================*/
/**
 *  Builds the table.  Should be overridden.
 */
    public function buildTable():Void {
        //clearTable();
        buildHeader();
    }
 
/*  Private Members
 *  =========================================================================*/
    private var table:TableView;
 
/*  Private Methods
 *  =========================================================================*/
/**
 *  @private
 *  Clears all entries in the table, including the header
 */
    private inline function clearTable():Void
        table.dataSource.removeAll();
        
/**
 *  @private
 *  Builds the header.  Should be overridden.
 */
    private function buildHeader():Void {}
 
}