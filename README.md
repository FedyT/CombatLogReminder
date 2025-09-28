# CombatLogReminder
Automatic Combat Log Reminder for World of Warcraft

CombatLogReminder is a lightweight WoW addon that automatically enables and disables the combat log when you enter or leave dungeons/raids. It shows a small movable circle indicator on your screen: green when combat logging is active, red when disabled.
You can also manually toggle the combat log using slash commands.

Features:

✅ Automatic combat log management in dungeons and raids

✅ Movable circle indicator with red/green status

✅ Slash commands for manual control

✅ Minimal and lightweight; no external dependencies

<img width="922" height="166" alt="image" src="https://github.com/user-attachments/assets/5e0a783d-65a8-4d1f-a60f-265fc760e713" />

Installation:

Download the repository.

Copy the CombatLogReminder folder to:

World of Warcraft/_retail_/Interface/AddOns/


Make sure the folder contains:

CombatLogReminder/
 ├─ CombatLogReminder.toc
 ├─ CombatLogReminder.lua
 ├─ green.png
 └─ red.png


Launch WoW and enable CombatLogReminder in the AddOns menu.

Usage
Automatic Mode

Entering a dungeon or raid → Combat Log is automatically enabled (green circle).

Leaving a dungeon/raid → Combat Log is automatically disabled (red circle).

Manual Commands

/clon → Force enable combat log

/cloff → Force disable combat log

Moving the Indicator

Click and drag the circle anywhere on your screen.

Position is saved automatically between sessions.

Customization

Replace green.png and red.png with your own 16x16 (or larger) PNG icons if you want a different look.

The indicator size can be adjusted by changing the SetSize() value in CombatLogReminder.lua.

Folder Structure
CombatLogReminder/
 ├─ CombatLogReminder.toc
 ├─ CombatLogReminder.lua
 ├─ green.png    
 └─ red.png

License

MIT License – feel free to use, modify, and share.

Contributing

Pull requests and issues are welcome. Please make sure your icon files are included if you modify the look of the circle.
