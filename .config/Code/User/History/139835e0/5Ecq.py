#!/usr/bin/env python3

import xml.etree.ElementTree as ET
import sys
import os
from datetime import datetime

def indent_xml(elem, level=0):
    """Add proper indentation to XML elements"""
    i = "\n" + level * "  "
    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
        for child in elem:
            indent_xml(child, level + 1)
        if not child.tail or not child.tail.strip():
            child.tail = i
    else:
        if level and (not elem.tail or not elem.tail.strip()):
            elem.tail = i

def clean_and_update_xml(xml_file, layout_name, layout_description):
    """Remove old layouts and add new consolidated layout with proper XML formatting"""
    
    try:
        # Parse the XML file
        tree = ET.parse(xml_file)
        root = tree.getroot()
        
        # Find layoutList element
        layout_list = root.find(".//layoutList")
        if layout_list is None:
            print(f"   Error: Could not find layoutList in {xml_file}")
            return False
        
        # Remove existing layouts with the same name
        layouts_to_remove = []
        for layout in layout_list.findall("layout"):
            name_elem = layout.find(".//name")
            if name_elem is not None and name_elem.text == layout_name:
                layouts_to_remove.append(layout)
                print(f"   Removing existing layout '{layout_name}' from {xml_file}")
        
        for layout in layouts_to_remove:
            layout_list.remove(layout)
        
        # Create new layout element with proper structure
        layout = ET.Element("layout")
        
        # Add proper indentation and structure
        config_item = ET.SubElement(layout, "configItem")
        
        name = ET.SubElement(config_item, "name")
        name.text = layout_name
        
        short_desc = ET.SubElement(config_item, "shortDescription")
        short_desc.text = layout_name
        
        description = ET.SubElement(config_item, "description")
        description.text = layout_description
        
        lang_list = ET.SubElement(config_item, "languageList")
        iso639 = ET.SubElement(lang_list, "iso639Id")
        iso639.text = "eng"
        
        # Insert at the beginning of layoutList
        layout_list.insert(0, layout)
        
        # Apply proper indentation to the entire tree
        indent_xml(root)
        
        # Create backup
        backup_name = f"{xml_file}.backup.{datetime.now().strftime('%Y%m%d-%H%M%S')}"
        os.system(f"cp {xml_file} {backup_name}")
        
        # Write back to file with proper formatting
        tree.write(xml_file, encoding='utf-8', xml_declaration=True)
        
        print(f"   ✅ Updated {os.path.basename(xml_file)} with proper XML formatting")
        return True
        
    except Exception as e:
        print(f"   ❌ Error processing {xml_file}: {e}")
        return False

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 update_xml.py <layout_name> <layout_description>")
        sys.exit(1)
    
    layout_name = sys.argv[1]
    layout_description = sys.argv[2]
    
    xml_files = [
        "/usr/share/X11/xkb/rules/base.xml",
        "/usr/share/X11/xkb/rules/evdev.xml"
    ]
    
    success = True
    for xml_file in xml_files:
        if os.path.exists(xml_file):
            if not clean_and_update_xml(xml_file, layout_name, layout_description):
                success = False
        else:
            print(f"   Warning: {xml_file} not found")
    
    return success

if __name__ == "__main__":
    sys.exit(0 if main() else 1)