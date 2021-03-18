#### Race condition problem

- Open editor 1 - copy of editor 1 content made
- Open editor 2 - copy of editor 2 content made
- Modify content in editor 1 a bit
- Click save in editor 2 and the content in editor 1 is set back to the original content

This is because the save in editor 2 fires a refresh of all the data, including that of the editor 1 content (which gets refreshed, even though it is open).