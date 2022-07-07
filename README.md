# Evil-WinRm-RemotePathCompletion-Script


Script to help you get up and running **[Evil-WinRm](https://github.com/Hackplayers/evil-winrm)** with **Remote Path Completion Enabled**.    
Currently the **Remote Path Completion feature** is implemented using **readline**.    
There's currently an in-progress work to reimplement this feature using **reline**.     
But **reline** is not working as we expect [when using quotes](https://github.com/ruby/reline/issues/444) and it doesn't implement the **quoting_detection_proc** that facilitates doing the required job.



## Installation


    git clone https://github.com/arale61/Evil-WinRm-RemotePathCompletion-Script.git
    cd ./Evil-WinRm-RemotePathCompletion-Script/
    bash ./evil-winrm-remote-path-completion.sh # or zsh ./evil-winrm-remote-path-completion.zsh


After the script ends you should have **$HOME/.local/bin/evil-winrm** in your PATH environment variable.    
The script is not needed to just update (git pull) the new versions of **evil-winrm** but can also be used for if desired.



## Usage of the feature

For using the Remote Path Completion feature you should type paths using the **"/"** character and not the **"\\"** character.

![Tux, the Linux mascot](/images/sample.gif)



## The script steps

The **script** will try to help you to:
1. Remove the evil-winrm gem.
    - Make sure after removing the gems that no executable **evil-winrm** exists on **/usr/bin/evil-winrm** or **/bin/evil-winrm**.
2. Install **[rbenv](https://github.com/rbenv/rbenv)** in case is not installed.
    - With **rbenv** we can have custom **ruby versions** with **readline** support that doesn't collide with the system's default ruby installation.
3. Install **libssl-dev**, **libreadline-dev** and **libreadline8** required for ssl and readline support.
4. Select a **ruby** version to compile with **readline** support.
5. In case **openssl-3.x** is installed on the system then:
    - If **ruby 3.x** is selected then suggest to use **openssl-1.1.1o** since **ruby** is not fully supporting it yet (at least on *rbenv* instances).
    - If **ruby 2.x** is selected then require to use **openssl-1.1.1o** since greater versions are not supported.
6. Compile and install the **ruby** version selected with the desired configuration.
    - If **openssl-1.1.1o** is selected, then it will compile it for use with the ruby version **selected** (this is the preferred right now).
7. Clone and setup a local copy of **evil-winrm** at **$HOME/.local/opt/evil-winrm** and add a script to execute it at **$HOME/.local/bin/evil-winrm**

The script uses **sudo** for installing the **rbenv, libssl-dev, libreadline-dev, libreadline8** and for **uninstalling evil-winrm** gems.    
The script tries to **default** safety if only **enter** is used instead of **y/n**.



## Why all this?

This feature was only possible to implement using **readline** and not **reline**.    
Ruby decided some time ago to don't distribute **readline** compiled versions, and went for **reline**.    
At this point, we came up with the possibility to offer the **Remote Path Completion feature** if you **compile your own version of ruby** with **readline enabled**.    
This can be done easily and safetly with **rbenv**.    

Then **OpenSSL 3** was launched and **ruby** had some problems with **versions 2.x** to support it, and even with the newest *3.x* versions seems to fail at runtime. In order to avoid these problems, a local copy of **openssl-1.1.1o** can be used to compile ruby with.    
The **openssl** remains a local copy and doesn't collide with the **default openssl** installed on your system.    

Maybe is possible to **enable** **legacy provider** via **openssl.cnf** to make **openssl 3.x** work with the **rbenv ruby 3.x** instances, but I wasn't able to do it.
