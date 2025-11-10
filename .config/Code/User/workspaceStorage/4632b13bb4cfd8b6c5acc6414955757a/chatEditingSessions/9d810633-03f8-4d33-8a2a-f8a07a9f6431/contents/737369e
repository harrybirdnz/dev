#!/usr/bin/env python3

import xml.etree.ElementTree as ET
import sys
import os
from datetime import datetime

def add_layout_to_xml(xml_file, layout_name, layout_description):
    """Add Harry's keyboard layout to XKB XML file if not already present"""
    
    # Check if layout already exists
    try:
        tree = ET.parse(xml_file)
        root = tree.getroot()
        
        # Look for existing layout with the specified name
        for layout in root.findall(".//layout"):
            name_elem = layout.find(".//name")
            if name_elem is not None and name_elem.text == layout_name:
                print(f"   Layout '{layout_name}' already exists in {xml_file}")
                return True
        
        # Find layoutList element
        layout_list = root.find(".//layoutList")
        if layout_list is None:
            print(f"   Error: Could not find layoutList in {xml_file}")
            return False
        
        # Create new layout element
        layout = ET.Element("layout")
        
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
        
        # Insert at beginning of layoutList
        layout_list.insert(0, layout)
        
        # Create backup
        backup_name = f"{xml_file}.backup.{datetime.now().strftime('%Y%m%d-%H%M%S')}"
        os.system(f"sudo cp {xml_file} {backup_name}")
        
        # Write back to file
        tree.write(xml_file, encoding='utf-8', xml_declaration=True)
        print(f"   ✅ Added layout '{layout_name}' to {xml_file}")
        return True
        
    except Exception as e:
        print(f"   Error processing {xml_file}: {e}")
        return False

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 add_layout_multi.py <layout_name> <layout_description>")
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
            if not add_layout_to_xml(xml_file, layout_name, layout_description):
                success = False
        else:
            print(f"   Warning: {xml_file} not found")
    
    return success

if __name__ == "__main__":
    sys.exit(0 if main() else 1)