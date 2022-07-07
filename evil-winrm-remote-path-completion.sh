#!/usr/bin/env bash
# Author: arale61
#
# Error Samples:
#
# 1. OpenSSL 3.0.3-8 default system + rbvenv install 3.1.2:
#     Ref: https://bugs.gentoo.org/797673 known bugs?
#
#     ----
#     $ evil-winrm -i 10.10.XXX.XXX -S -u ausername -p 'SomeSuperPassword123!!' -s /path/with/ps1scripts
#
#     Evil-WinRM shell v3.5
#
#     Warning: SSL enabled
#
#     Info: Establishing connection to remote endpoint
#
#     Error: An error of type OpenSSL::Digest::DigestError happened, message is Digest initialization failed: initialization error
#     Error: Exiting with code 1
#     ----
#     ----                                                                                                                                                                                                                                           
#     $ evil-winrm -i 10.10.xx.xxx -u xxxxxxxxxx -p 'xxxxXXXxxxxXxxX'
#
#     Evil-WinRM shell v3.5
#
#     Info: Establishing connection to remote endpoint
#
#     Error: An error of type OpenSSL::Digest::DigestError happened, message is Digest initialization failed: initialization error
#     Error: Exiting with code 1
#     ----
# Modify evil-winrm.rb exception to present the backtrace with ex.backtrace.join("\n")
#
#
# $ evil-winrm -i 10.10.XXX.XXX -S -u ausername -p 'SomeSuperPassword123!!' -s /path/with/ps1scripts
#
# Evil-WinRM shell v3.5
#
# Warning: SSL enabled
#
# Info: Establishing connection to remote endpoint
#
# Error: An error of type OpenSSL::Digest::DigestError happened, message is Digest initialization failed: initialization error
# Backtrace:
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/3.1.0/openssl/digest.rb:35:in `initialize'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/3.1.0/openssl/digest.rb:35:in `block (3 levels) in <class:Digest>'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/3.1.0/openssl/digest.rb:41:in `new'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/3.1.0/openssl/digest.rb:41:in `block (3 levels) in <class:Digest>'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/rubyntlm-0.6.3/lib/net/ntlm.rb:149:in `ntlm_hash'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/rubyntlm-0.6.3/lib/net/ntlm.rb:162:in `ntlmv2_hash'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/rubyntlm-0.6.3/lib/net/ntlm/client/session.rb:192:in `ntlmv2_hash'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/rubyntlm-0.6.3/lib/net/ntlm/client/session.rb:196:in `calculate_user_session_key!'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/rubyntlm-0.6.3/lib/net/ntlm/client/session.rb:27:in `authenticate!'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/rubyntlm-0.6.3/lib/net/ntlm/client.rb:36:in `init_context'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/http/transport.rb:244:in `init_auth'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/http/transport.rb:168:in `send_request'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/power_shell.rb:153:in `max_envelope_size_kb'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/power_shell.rb:78:in `max_fragment_blob_size'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/power_shell.rb:203:in `fragmenter'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/power_shell.rb:167:in `block in open_shell_payload'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/power_shell.rb:166:in `map'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/power_shell.rb:166:in `open_shell_payload'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/power_shell.rb:123:in `open_shell'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/base.rb:170:in `block in open'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/retryable.rb:35:in `retryable'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/base.rb:168:in `open'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/base.rb:128:in `with_command_shell'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/shells/base.rb:79:in `run'
# /home/arale/.local/opt/evil-winrm/evil-winrm.rb:573:in `block in main'
# /home/arale/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/winrm-2.3.6/lib/winrm/connection.rb:42:in `shell'
# /home/arale/.local/opt/evil-winrm/evil-winrm.rb:521:in `main'
# /home/arale/.local/opt/evil-winrm/evil-winrm.rb:974:in `<main>'

# Error: Exiting with code 1

#---------------------------------------------------------------------------------------------
# 2. OpenSSL 3.0.3-8 default system + rbenv install 3.0.4
#
#   rbenv install 3.0.4 errors:
#     Error compiling extensions for openssl:
#     ----
#     *** Following extensions are not compiled:
#     dbm:
#         Could not be configured. It will not be installed.
#         Check ext/dbm/mkmf.log for more details.
#     gdbm:
#         Could not be configured. It will not be installed.
#         Check ext/gdbm/mkmf.log for more details.
#     openssl:
#         Could not be configured. It will not be installed.
#         /tmp/ruby-build.20220703163435.154646.cXO9Nt/ruby-3.0.4/ext/openssl/extconf.rb:113: OpenSSL >= 1.0.1, < 3.0.0 or LibreSSL >= 2.5.0 is required
#         Check ext/openssl/mkmf.log for more details.
#     ----
#
#---------------------------------------------------------------------------------------------
# ref: https://askubuntu.com/questions/1126893/how-to-install-openssl-1-1-1-and-libssl-package


######################################################
# globals:
# default evil-winrm branch
#
sel_b=dev 

# holds selected ruby version to install
ruby_version=

# flag for when ruby 2.x versions are selected
ruby_2_based=0

# openssl 1.1.1 to download
openssl_version=openssl-1.1.1o

# installed openssl version
ssl_version=`dpkg -s openssl | grep Version | cut -d':' -f2- | tr " " "_" | cut -d'_' -f2-`

# custom openssl installation dir
openssl_dir=$HOME/.local/opt/openssl

# flag for openssl 1.1.1
openssl_leg=0

# evil-winrm git clone directory
clone_dir=$HOME/.local/opt/evil-winrm

# evil-winrm git clone done flag
clone_done=0

# executable
launcher=$HOME/.local/bin/evil-winrm                                                 
#
######################################################


######################################################
# functions:
#
print_banner(){
    echo -e '''
    bash based script


    Evil-WinRM wiht Remote Path Completion 
    Enabled.
    Ruby is not shipped with readline support by 
    default.
    readline is required for the remote path 
    completion feature as an implementation 
    constrain.
    Newer versions of openssl (=> 3*) gave me 
    problems either for building (ruby =< 3.0.4, not 
    supported) or at runtime (ruby == 3.1.2, see 
    samples above commented) for running evil-winrm.
    Trying to find a solution I just copy pasted the
    commands into this script.
    This script tries to assist you to use rbenv to 
    install a ruby version with readline support. And
    in case of using openssl 3 it will try to build a
    local copy of openssl-1.1.1o which works fine.

    This script prompts you for: 
        - uninstall existing evil-winrm gems
        - if not installed, install rbenv
        - installing a local copy of a supported 
          version of openssl
        - installs ruby version with readline enabled
        - to clone a selected branch of 
          evil-winrm @ github
        - sets up the rbenv to use selected ruby with 
          evil-winrm
        - Creates a shell script for execute 
          evil-winrm.rb
        - Adds to .bashrc paths for rbenv and 
          evil-winrm

    '''
    echo -e "\nTested with:"
    echo -e "- 5.18.0-kali2-amd64"
    echo -e "- GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)"
    echo -e "- OpenSSL 3.0.3 3 May 2022"
    echo -e "- ruby 3.0.3p157 (2021-11-24 revision 3fb7d2cadc) [x86_64-linux-gnu]\n"
}

remove_evil_winrm_gems(){
    echo -e "[?] Try to (sudo)gem uninstall evil-winrm? [yes/No]"
    input=
    read input
    if [[ $input =~ ^[yY] ]]
    then
        echo -e "[!] Trying to uninstall gems..."
        sudo gem uninstall evil-winrm -q
        gem uninstall evil-winrm -q
    fi
}

install_rbenv(){
    dpkg -s rbenv &> /dev/null
    if [[ $? -eq 0 ]]; then
        echo -e "[+] Package rbenv is installed!"
    else
        echo -e "[-] Package rbenv is NOT installed!"
        input=
        echo -e "[?] Install rbenv with sudo apt install rbenv? [Yes/no]"
        read input
        if [[ $input =~ ^[nN] ]]; then
            echo -e "[+] Not installing rbenv... Exiting the script"
            return 1
        else
            echo -e "[!] Installing rbenv..."
            sudo apt install rbenv
        fi
    fi
}

install_libssl(){
    dpkg -s libssl-dev &> /dev/null
    if [[ $? -eq 0 ]]; then
        echo -e "[+] Package libssl-dev is installed!"
    else
        echo -e "[!] Trying to install package libssl-dev"
        sudo apt install -y libssl-dev
    fi
}

register_rbenv_path(){
    rbenv_path_registered=`grep -iE "^export PATH" $HOME/.bashrc | cut -d':' -f1- | grep "/.rbenv/bin"`
    if [[ ${#rbenv_path_registered} -eq 0 ]]; then
        echo -e "[!] Registering rbenv path .bashrc"
        echo 'export PATH="$PATH:$HOME/.rbenv/bin"' >> $HOME/.bashrc
        echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
        source $HOME/.bashrc
        echo -e "[+] Registered rbenv path in $HOME/.bashrc"
    fi
}

select_ruby_version(){
    default_version=
    versions=`rbenv install --list | grep -E "^[0-9]" | sort -d -r`
    read default_version __ <<< $versions
    echo -e "[?] Enter the ruby version (default: $default_version)"
    echo -e "$versions\n"
    input=
    read input
    if [[ $input = [123]\.*\.* ]]; then # lazy....
        ruby_version=$input
        if [[ $ruby_version = 2.* ]]; then
            ruby_2_based = 1
        fi
    else
        ruby_version=$default_version
    fi
}

check_openssl_version(){
    echo -e "[!] Checking openssl version..."

    if [[ $ssl_version =~ 3* ]]; then
        if [[ $ruby_2_based -eq 1 ]]; then
            echo -e "[X] The version installed, $ssl_version, is not supported by ruby $ruby_version"
            echo -e "[!] Install a local copy of $openssl_version."
        else
            echo -e "[!] The version installed, $ssl_version, may not be fully supported by ruby $ruby_version"
        fi
    fi
}

install_custom_openssl_for_ruby(){
    echo -e "[?] Do you want to use a local copy of $openssl_version for ruby $ruby_version? [Yes/no]"
    input=
    read input

    if [[ $input =~ ^[nN] ]]; then
        echo -e ">>> [!!] In case of ruby build/runtime errors due to openssl try executing this step next time."
    else
        if [[ -f $openssl_dir/lib/libssl.so.1.1 ]]; then
            openssl_leg=1
            echo -e "[+] Local version of $openssl_version found!"
        else
            echo -e "[!] Installing a local version of $openssl_version at: "
            echo -e "    $openssl_dir"
            mkdir $openssl_dir
            cd $openssl_dir
            wget "https://www.openssl.org/source/old/1.1.1/$openssl_version.tar.gz"
            tar -zxf ./$openssl_version.tar.gz
            cd -
            cd $openssl_dir/$openssl_version/
            ./config --prefix=$openssl_dir --openssldir=$openssl_dir/ssl

            echo '>>> [!!] Building openssl can take some minutes'
            make -s
            make -s install_sw

            PATH=$openssl_dir/bin:${PATH}
            openssl_leg=1
            cd -
        fi
    fi
}

install_ruby(){
    echo -e "[?] Install ruby version $ruby_version with readline support with rbenv? [Yes/no]"
    input=
    read input

    if [[ $input =~ ^[nN] ]]
    then
        echo -e "[X] Not installing a ruby version"
    else
        dpkg -s libreadline-dev &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "[+] Package libreadline-dev is installed!"
        else
            echo -e "[X] Package libreadline-dev is NOT installed!"
            echo -e "[!] Trying to install it..."
            sudo apt install libreadline-dev libreadline8
        fi

        if [[ $openssl_leg -eq 1 ]]; then
            echo -e "[!] Building ruby with openssl at $openssl_dir (can take a while)"

            RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/include/readline --with-openssl-dir=$openssl_dir" rbenv install $ruby_version
        else
            openssl_def_path=`openssl version -d | grep OPENSSLDIR: | cut -d'"' -f2`
            echo -e "[!] Building ruby $ruby_version with default openssl at $openssl_def_path"
            RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/include/readline --with-openssl-dir=$openssl_def_path" rbenv install $ruby_version
        fi
    fi
}

select_evil_winrm_branch(){
    echo -e "[?] Type the branch to clone from [dev/master]"
    input=
    read input
    if [[ $input == "master" ]]; then
        sel_b="master"
    else
        sel_b="dev"
    fi
    echo -e "[+] Selected branch will be: $sel_b"
}

clone_evil_winrm(){
    echo -e "[!] Checking for local user repository in $clone_dir"
    git -C $clone_dir status -s &> /dev/null
    if [[ $? -eq 0 ]];
    then
        echo -e "[!] A current cloned repository exists"
        input=
        echo -e "[!!] Delete the directory? [yes/No] "
        read input
        if [[ $input =~ [yY] ]]; then
            echo -e "[!!] Deleting the current copy..."
            rm -rf $clone_dir
        else
            input=
            echo -e "[?] Update the local copy? [yes/No]"
            read input
            if [[ $input =~ [yY] ]]; then
                git -C $clone_dir branch $sel_b
                git -C $clone_dir pull
                echo -e "[+] Update Done"            
            fi
            clone_done=1
        fi
        echo -e "[+] Current local repository ready"
    elif [[ -f $clone_dir/evil-winrm.rb ]]; then
        input=
        echo -e "[!!] The directory exists. Delete it or quit the script. [delete/QUIT]"
        read input
        if [[ $input =~ ^[dD] ]]; then
            echo -e "[!] Deleting the current copy..."
            rm -rf $clone_dir
        else
            return 2
        fi
    fi
    if [[ $clone_done -eq 0 ]]; then
        if [[ $sel_b =~ ^[dD] ]]; then
            git clone https://github.com/Hackplayers/evil-winrm.git -b dev $clone_dir
            echo -e "[+] Dev branch selected."
        else
            git clone https://github.com/Hackplayers/evil-winrm.git $clone_dir
            echo -e "[+] master branch selected"
        fi
    fi

}

configure_winrm_workspace(){
    cd "$clone_dir" && rbenv local $ruby_version
    echo -e '[+] rbenv ruby version set!'

    echo -e "[!] Trying to install gems"

    gem install winrm winrm-fs
    echo -e "[+] gems installed."
    cd -
}

generate_executable(){
    echo -e "[!] Generating evil-winrm launcher at"
    echo -e "$launcher"
    echo -e "----------------------------------------"

    if [[ -f "$launcher" ]];
    then
        rm "$launcher"
        echo -e "[!!] Deleted old launcher version"
    fi

    cat << EOF > $launcher
#!/usr/bin/env bash

$clone_dir/evil-winrm.rb \$@
EOF

    chmod u+x $launcher
    echo -e "[+] Generated evil-winrm launcher at $launcher"
}

register_executable_path(){
    l_path_registered=`grep -iE "^export PATH" $HOME/.bashrc | cut -d':' -f1- | grep /.local/bin`
    if [[ ${#l_path_registered} -eq 0 ]]; then
        echo -e "[!] Registering local path $HOME/.local/bin in .bashrc"
        echo 'export PATH=$PATH:$HOME/.local/bin' >> $HOME/.bashrc
        source $HOME/.bashrc
        echo -e "[+] Registered local path in $HOME/.bashrc"
    else
        echo -e "[+] Path already registered at .bashrc"
    fi
}

#
######################################################


######################################################
#Main
#
print_banner

echo -e "\n\n----------------------------------------"
echo -e "[1] Remove gem dependecies"
echo -e "----------------------------------------\n"
remove_evil_winrm_gems

echo -e "\n\n----------------------------------------"
echo -e "[2] Configure rbenv"
echo -e "----------------------------------------\n"
install_rbenv
register_rbenv_path

echo -e "\n\n----------------------------------------"
echo -e "[3] Select ruby version"
echo -e "----------------------------------------\n"
select_ruby_version

echo -e "\n\n----------------------------------------"
echo -e "[4] Configure openssl $openssl_version"
echo -e "----------------------------------------\n"
install_libssl
check_openssl_version
install_custom_openssl_for_ruby

echo -e "\n\n----------------------------------------"
echo -e "[5] Install Ruby $ruby_version"
echo -e "----------------------------------------\n"
install_ruby

echo -e "\n\n----------------------------------------"
echo -e "[6]. Getting evil-winrm to work"
echo -e "----------------------------------------\n"
select_evil_winrm_branch
clone_evil_winrm
configure_winrm_workspace
generate_executable
register_executable_path

echo -e ""
echo -e "End of the script."