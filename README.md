# Viewport Debug Print for Godot

A quick and easy on-screen logger for debugging in Godot.  
Supports `log()`, `warn()`, and `error()` with different styles and colors.  
Drop it into your project and stop digging through the output console 👀

---

## 📦 Installation

1. Download and extract the folder into your Godot project directory.
2. In the Godot editor, go to:  
   `Project > Project Settings > Autoload`
3. Add the `ViewportDebugPrint.tscn` scene:
   - Set the name to whatever you like (e.g. `Debug`)
   - Click **"Add"**
4. That's it — you're ready to go!

---

## 🛠️ Usage

You can now call the following global functions anywhere in your code:

```gdscript
Debug.log("This is a regular log")
Debug.warn("This is a warning!")
Debug.error("Something went wrong 😱")
```
P.S. To use these functions, your autoload, must be named "Debug"
