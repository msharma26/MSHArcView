# MSHArcView
An Inpspectable Arc View for iOS 8-9

A 3/4 static arc view to display progress.
==============

- Made with Swift
- iOS 8-9 at for now.
- IBDesignable with IBInspectable properties. Which means the storyboard/xib files will update to show the view.


Best usage
==============

- Create a View in Storyboard/Xib file
- Change its subclass to MSHArcView

Problem with Xcode 6.x.x
--------------

- xcode 6 shows an error in storyboard `Auto-Layout could not be updated`
- Clean the product and Cache folder. 
- Restart Xcode. (And not just the project. Press Cmd+Q)

- If the problem still persists go to Build settings of Target
- Find `Runpath Search Paths`
- Add `$loader_path/Frameworks` for both Debug and release
- Clean and Restart xcode again. Should fix it.

- If still doesn't work, wait for full Xcode 7
