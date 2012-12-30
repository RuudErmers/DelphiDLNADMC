TUpnpDMC is a class that implements a DLNA DMC (Digital Media Controller) in Delphi.
I needed some Delphi code to play Videos from my server to my SAMSUNG TV.
I could only find some partial implementation, one in Visual Basic and some code in Delphi, 
bur not a complete DMC, so I wrote this.
There is an example application in the directory UPNPDelphi.
On second thought, I should heva named the class TDLNADMC and the same for the example.
For now, I am just sharing this code.

You can browse the available servers and renderers on your system.
Once found, you can select an item from the server and play it on a renderer.
Then you can pause, stop, play, seek that item

You create a TUpnpDMC object by calling _create_, 
supplying an owner and a TStrings (not NIL) used as Log
You can search devices by _SearchDevices_
Set _OnDeviceListChanged_ to receive notifaction on Devices available
Then retrieve Servers and Renderers by inpecting _ServerCount_ and _GetServerName_ etc.
Select a Server with _SetServerIndex_, the same for a Renderer
Browse the Server tree with _BrowseRoot_ and subdirectories with _BrowseIndex_,
go back with _Back_
Inspect items with _GetItemName_ and _ItemCount_
Select an item with _SetItemIndex_

Now you can Play, Pause, Seek, SetPosition etc the item with the corresponding methods.
You can retrieve information bij GetPosition and GetPlayStatus
	