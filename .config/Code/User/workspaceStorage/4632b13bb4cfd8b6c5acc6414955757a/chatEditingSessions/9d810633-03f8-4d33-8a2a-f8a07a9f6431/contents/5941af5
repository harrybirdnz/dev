#!/usr/bin/env python3

import xml.etree.ElementTree as ET
import sys
import os
from datetime import datetime

def clean_and_update_xml(xml_file):
    """Remove old hb and hb_nz layouts, add new consolidated hb layout"""
    
    try:
        tree = ET.parse(xml_file)
        root = tree.getroot()
        
        # Find layoutList element
        layout_list = root.find(".//layoutList")
        if layout_list is None:
            print(f"   Error: Could not find layoutList in {xml_file}")
            return False
        
        # Remove existing hb and hb_nz layouts
        layouts_to_remove = []
        for layout in layout_list.findall("layout"):
            name_elem = layout.find(".//name")
            if name_elem is not None and name_elem.text in ["hb", "hb_nz"]:
                layouts_to_remove.append(layout)
                print(f"   Removing old layout '{name_elem.text}' from {xml_file}")
        
        for layout in layouts_to_remove:
            layout_list.remove(layout)
        
        # Create new consolidated layout element
        layout = ET.Element("layout")
        
        config_item = ET.SubElement(layout, "configItem")
        
        name = ET.SubElement(config_item, "name")
        name.text = "hb"
        
        short_desc = ET.SubElement(config_item, "shortDescription")
        short_desc.text = "hb"
        
        description = ET.SubElement(config_item, "description")
        description.text = "English (Harry)"
        
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
        print(f"   ✅ Updated {xml_file} with consolidated 'hb' layout")
        return True
        
    except Exception as e:
        print(f"   Error processing {xml_file}: {e}")
        return False

def main():
    xml_files = [
        "/usr/share/X11/xkb/rules/base.xml",
        "/usr/share/X11/xkb/rules/evdev.xml"
    ]
    
    success = True
    for xml_file in xml_files:
        if os.path.exists(xml_file):
            if not clean_and_update_xml(xml_file):
                success = False
        else:
            print(f"   Warning: {xml_file} not found")
    
    return success

if __name__ == "__main__":
    sys.exit(0 if main() else 1)