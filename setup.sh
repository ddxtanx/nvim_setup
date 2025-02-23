#!/bin/bash

code_lldb_path=$(find ./lua/plugins/dap -name codelldb | wc -l)

if [ $code_lldb_path -eq 0 ]
then
  if command -v code &> /dev/null
  then
    arch_val=$(uname -m)
    if [ $arch_val == "x86_64" ]
    then
      sysname=$(uname)
      if [ $sysname == "Linux" ]
      then
        echo "Installing codelldb extension for x86_64 Linux"
        wget https://github.com/vadimcn/codelldb/releases/download/v1.11.4/codelldb-linux-x64.vsix -O /tmp/codelldb.vsix
      elif [ $sysname == "Darwin" ]
      then
        echo "Installing codelldb extension for x86_64 Darwin"
        wget https://github.com/vadimcn/codelldb/releases/download/v1.11.4/codelldb-darwin-x64.vsix -O /tmp/codelldb.vsix
      fi
    elif [ $arch_val == "aarch64" ] || [ $arch_val == "arm64" ]
    then
      echo "Installing codelldb extension for aarch64"
      sysname=$(uname)
      if [ $sysname == "Linux" ]
      then
        echo "Installing codelldb extension for aarch64 Linux"
        wget https://github.com/vadimcn/codelldb/releases/download/v1.11.4/codelldb-linux-arm64.vsix -O /tmp/codelldb.vsix
      elif [ $sysname == "Darwin" ]
      then
        echo "Installing codelldb extension for aarch64 Darwin"
        wget https://github.com/vadimcn/codelldb/releases/download/v1.11.4/codelldb-darwin-arm64.vsix -O /tmp/codelldb.vsix
      fi
    fi
    code --install-extension /tmp/codelldb.vsix
    cp -r $HOME/.vscode/extensions/vadimcn.vscode-lldb-1.11.4 ./lua/plugins/dap/codelldb

  else
    echo "The codelldb extension is not installed, please either install it manually or install vscode for automated installation."
    exit
  fi
fi
