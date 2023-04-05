To reproduce the issue
----------------------

* Optional: Install podman and change common.sh if you want to use podman
            to build and run the container.
* Build and run the image with: `./build.sh && ./run.sh`
  * This should drop you into a neovim process which installs
    the necessary language servers to reproduce this issue.
* Wait for Mason to update it's package list and then for ansible-lint to finish installing.
  * This takes about 15-20 seconds on my machine, so patience is a virtue.
* Press 'q' to close the Mason menu.
* Run `:AleInfo` or any other diagnostic commands necessary.
* Exit out of the editor with `:wq`
* You should see the error in your terminal, similar to:
```
[me@host ale_issue]$ ./run.sh 

Error detected while processing function <SNR>69_NeoVimCallback[35]..function <SNR>69_NeoVimCallback[29]..<lambda>16[1]..<SNR>50_ExitCallback[28]..<SNR>49_HandleExit[30]..ale#engine#HandleLoclist[15]..ale#engine#FixLocList:
line   16:
E1098: String, List or Blob required
```
