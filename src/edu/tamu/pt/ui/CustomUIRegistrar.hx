package edu.tamu.pt.ui;

import haxe.ui.toolkit.core.interfaces.IDisplayObject;
import haxe.ui.toolkit.core.ClassManager;

import edu.tamu.pt.ui.TextTable.TextTableComponent;
import edu.tamu.pt.ui.TextTable.TextTableCellComponent;
import edu.tamu.pt.ui.TextTable.TextTableHeadComponent;

/** CustomUIRegistrar Class
 *  @author  Timothy Foster
 * 
 *  Static class responsible for registering custom UI components.  Simply
 *  call registerAll().  Registering components allows them to be used in
 *  XML files.  For instance, creating a SmartTextInput in an XML file can
 *  now be done simply with <smarttextinput />
 *  **************************************************************************/
class CustomUIRegistrar {
/**
 *  Registers all UI components.
 */
    public static function registerAll():Void {
        register(SmartTextInput, "smarttextinput");
        register(NameSortSelector, "namesortselector");
        register(SmartListView, "smartlistview");
        register(TextTableComponent, "texttable");
        register(TextTableCellComponent, "texttablecell");
        register(TextTableHeadComponent, "texttablehead");
        register(AmPmSelector, "ampmselector");
    }
    
/**
 *  Registers a single UI component.
 *  @param c The component to register.
 *  @param name The simple name for the component to be used in XML files.
 */
    public static inline function register(c:Class<IDisplayObject>, name:String):Void {
        ClassManager.instance.registerComponentClass(c, name);
    }
}